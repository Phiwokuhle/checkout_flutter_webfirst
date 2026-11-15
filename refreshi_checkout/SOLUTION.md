# Solution and engineering decisions

## Scope
One screen for catalog + checkout, one simulated sign-in, one order details screen with pending/confirmed states. No real payment, backend, profile, or dashboard.

## Architecture
Feature-first clean architecture (presentation/domain/data), intentionally not a heavyweight use-case-per-action implementation. UI consumes Cubit; the domain repository is a contract; the GraphQL adapter calls an in-process Link. `get_it` supplies dependencies. Catalog values are intentionally fixed local dummy data.

## Typed GraphQL
The repo contains a GraphQL schema and create/fetch operations. Typed Dart DTOs are checked in under `core/generated` and used by the repository and UI. The small `tool/generate_graphql.py` script validates the schema and operations against the checked-in models. **Limitation:** this is a schema validation step, not a complete schema-to-Dart generator. A production solution would use Ferry/Artemis/graphql_codegen to regenerate DTOs and operation classes automatically. This is a known gap against the assessment's full code-generation requirement.

The GraphQL package parses and executes operation documents via a custom in-process Link. Dynamic JSON maps exist only inside the local GraphQL transport and DTO deserialization, not in application state or UI. No HTTP service is started.

## Financial outcome safety
The checkout Cubit coalesces simultaneous calls to `confirm` and disables the button while submitting. A UUID idempotency key is persisted with the draft fingerprint. The local Link checks for an existing key before creating a new order. Orders are persisted in `SharedPreferences`, so refresh and retry recover the same order. The order ID is deterministic from the key. A simulated hold is computed from `createdAt + 4 seconds` so refresh does not restart the hold or create a second hold. **Limitations:** browser storage can be cleared; SharedPreferences is not a transactional cross-tab database. This is an in-app simulation, not a guarantee of exactly-once financial execution in a distributed system. A real backend would enforce unique idempotency keys transactionally.

## Authentication and navigation
`go_router` supports `/orders/:id` direct links and refresh. A simulated persisted session protects order routes and redirects to `/sign-in?from=...`; sign-in returns to the original URL. No credentials are validated by a server.

## Trade-offs
- In-process GraphQL Link avoids an unnecessary server but cannot demonstrate a network failure boundary.
- Date/time selection uses built-in Flutter pickers, prioritizing reliability over custom controls.
- Order status is polled every second while pending, rather than adding subscriptions for a 4-second simulated transition.
- Browser persistence is lightweight, suitable only for this local demonstration.
- The Stitch project URL could not be inspected in this environment, so the interface uses the agreed minimal teal/neutral design direction.

## AI usage
OpenAI ChatGPT was used for planning, implementation drafting, and static review. Example accepted prompt: "Build a web-first Flutter checkout slice with feature-first clean architecture, Bloc, go_router, typed GraphQL, in-app data and persisted idempotency." Accepted: a small feature-first split and a persisted idempotency key. Changed: avoided a separate backend and unnecessary use-case classes. Rejected: extra catalog features, profiles, address management, and real payment integrations. Verification performed: source-level inspection only; Flutter SDK is not installed in the authoring environment. Run `flutter analyze` and device/browser testing before submission.

## Verification checklist
- [ ] `flutter analyze`
- [ ] `flutter run -d chrome`
- [ ] Responsive web at narrow and wide widths
- [ ] Direct order URL when signed out, then return after sign-in
- [ ] Browser refresh while hold pending
- [ ] Rapid double confirm and same-key retry
- [ ] Android/iOS run
- [ ] Record 5–10 minute walkthrough
