# Refreshi — 9-minute narrated technical demonstration

**Source:** implementation on `feature/complete-checkout-journeys`, PR #1.  
**Format:** record screen + microphone; alternate between IDE and running Chrome app.  
**Before recording:** `flutter pub get`, `dart run build_runner build --delete-conflicting-outputs`, `flutter analyze`, `flutter test`, `flutter run -d chrome`. Confirm the chosen future slot is valid. Keep an incognito window available for the deep-link demonstration.

## 0:00–1:15 — Architecture first

**Show:** `lib/main.dart`, `lib/core/di/injection.dart`, then project folders.

**Say:**
> “I structured Refreshi as a web-first Flutter checkout with distinct presentation, application-state, domain, and data responsibilities. Pages compose dedicated widget classes. Checkout and Orders each have a Bloc, with Freezed events and states. Business decisions are expressed through use cases, while repositories hide the data source. For this assessment, the data source is a GraphQL client connected to an in-process resolver, not a separate HTTP backend.”
>
> “The app starts by configuring dependencies through get_it. It registers SharedPreferences, the demo auth session, a GraphQLClient, the catalog and order repositories, and the router. That keeps construction separate from the widgets.”

**Trace:** widget → Bloc → use case → repository → GraphQLClient → LocalOrderLink → fixture / OrderStore.

**Be precise:** `AuthSession` still extends ChangeNotifier for router refresh; the feature flows use Bloc. `OrderStore` currently lives under `domain/checkout/data` and imports SharedPreferences; this is a deliberate demo shortcut, not a fully isolated domain model.

## 1:15–2:10 — Navigation and sign-in

**Show:** `lib/core/config/router.dart`, `lib/core/config/auth_session.dart`, `lib/presentation/auth/pages/signin_page.dart`, `lib/presentation/auth/widgets/sign_in_form.dart`; then browser.

**Say:**
> “Routing is declarative using go_router and clean path URLs. The checkout and order-details routes are protected by a simulated session. When an unauthenticated user opens an order URL, the router sends them to sign-in with the original destination in the `from` parameter. Once the session changes, the router redirects back.”
>
> “The sign-in page is only composition. The form widget owns controllers, validation, password visibility, and submission. Credentials are not checked by a server; signing in sets a local demo-session flag.”

**Do:** Sign in with the prefilled demo values. If already authenticated, demonstrate deep-link return in a clean browser profile rather than claiming sign-in is real authentication.

## 2:10–4:45 — GraphQL: follow a request end to end (main technical slice)

**Show in this exact order:**

1. `lib/data/graphql/schema.graphql`
2. `lib/data/graphql/operations.graphql`
3. `assets/graphql/catalog.json`, `create_order.json`, `get_order.json`
4. `lib/data/checkout/graphql_service_catalog.dart`
5. `lib/data/orders/graphql_order_repository.dart`
6. `lib/data/graphql/local_order_link.dart`
7. `lib/data/graphql/local_graphql_fixtures.dart`
8. `lib/domain/checkout/data/order_store.dart`

**Say:**
> “The schema defines three operations: `GetServices`, `CreateOrder`, and `GetOrder`. A service has an ID, name, description, duration, price in integer cents, and optional badge. An order has service IDs, scheduled and creation timestamps, a total, and a hold status of PENDING or PLACED.”
>
> “These JSON files simulate the shape of GraphQL server responses. They contain a top-level `data` object. They are not just a hard-coded list embedded in a widget.”
>
> “When the checkout loads, `GraphqlServiceCatalog` sends `GetServices` through GraphQLClient with a no-cache fetch policy. `LocalOrderLink` identifies the operation, reads `catalog.json` through `LocalGraphqlFixtures`, waits briefly to simulate latency, and returns the `data.services` payload. The repository maps the response into service models and the Bloc emits the loaded state.”
>
> “For `CreateOrder`, the repository sends a mutation containing a stable request ID, selected service IDs, schedule, total cents, and a demo card token. The local link validates the token, asks OrderStore to create or reuse the order, then combines the persisted values with the response template.”
>
> “For `GetOrder`, the same client queries by order ID. The local link reads the persisted order and produces a GraphQL-shaped response. The order repository deserializes that response using generated `Mutation$CreateOrder` and `Query$GetOrder` models.”

**Important technical qualification:**
> “The order operations use generated GraphQL response types. The service catalog currently maps its response manually, so I would not describe every GraphQL operation as fully generated end to end. Likewise, the local link simulates the transport and resolver, but it is not a running GraphQL HTTP server.”

**Show:** the `__typename` fields in order responses and explain their role in typed response decoding. Point out `priceCents` / `totalCents` avoids floating-point money calculations.

**Show:** `OrderStore.create`, especially the request-ID lookup and in-flight `_pending` map.

**Say:**
> “The same request ID is reused on retry while the selection and schedule remain unchanged. The store checks existing orders and coalesces concurrent calls on that store instance. This demonstrates idempotency, although a production backend would need a transaction and a unique constraint.”

## 4:45–6:10 — Checkout feature slice: widget → Bloc → use case

**Show:** `lib/presentation/checkout/pages/checkout_page.dart`, widgets folder, `domain/checkout/state_management/checkout_event.dart`, `checkout_state.dart`, `checkout_bloc.dart`, `domain/checkout/usecases/`.

**Say:**
> “The page composes `ServiceSelection`, `SchedulePicker`, `SavedPaymentMethod`, `CheckoutSummary`, and `CatalogStatus`. These are classes in separate files rather than methods that return widgets.”
>
> “The UI dispatches events such as `CheckoutStarted`, `CheckoutServiceToggled`, `CheckoutDateChanged`, and `CheckoutSubmitted`. The Bloc emits immutable Freezed states and coordinates the use cases. `UpdateCheckoutSelection` enforces a maximum of two services and calculates the total from catalog prices. `PlaceCheckoutOrder` validates a future appointment and delegates creation to the repository.”
>
> “The `BlocListener` handles navigation on success, keeping the UI reactive instead of navigating from the repository.”

**Do in browser:** choose two services, attempt a third (show validation), choose a future date and time, point out the rand total and simulated Visa card, submit. Avoid promising a particular price if the catalog fixture has changed.

## 6:10–7:10 — Orders slice: deep link, refresh and payment-hold timeline

**Show:** `lib/presentation/orders/pages/order_details_page.dart`, `order_content.dart`, `order_summary_card.dart`, `order_timeline.dart`, `domain/orders/state_management/order_bloc.dart`, `domain/orders/usecases/get_order.dart` and `get_hold_refresh_delay.dart`.

**Say:**
> “The order page has the same architecture. `OrderBloc` receives a load event, calls `GetOrder`, and emits loading, ready, not-found, or failure states. The timeline reads an explicit hold status from Bloc state.”
>
> “A new order starts with a pending hold. The demo considers the hold placed four seconds after the stored creation timestamp. The Bloc schedules a refresh through the hold-refresh-delay use case. This is a simulated status transition, not a real payment gateway callback.”
>
> “Because the order is stored locally, a browser refresh can reload the same order ID and timeline. Clean URLs use `/orders/:orderId`.”

**Do:** show pending → placed if timing permits; refresh order URL. Note that cross-device persistence is not provided.

## 7:10–8:10 — Failure handling and quality

**Show:** `test/checkout_controller_test.dart` (historical filename, now Bloc tests), `test/order_bloc_test.dart`, `test/graphql_fixtures_test.dart`, `test/za_format_test.dart`, and the PR checks.

**Say:**
> “I test state transitions and use-case behaviour independently of the UI, including the two-service limit, missing scheduling, order-not-found, and repository failures. The fixture test checks bundled GraphQL response envelopes. CI runs dependency resolution, code generation, analysis, tests, and a web build.”
>
> “There are also local simulations for declined and timed-out card holds, triggered through the `simulate` query parameter. The UI is designed to recover from errors. One limitation of the current repository is that it wraps GraphQL exceptions in a generic order-creation failure, so the UI may not distinguish declined from timeout correctly. I would preserve typed error information in the next iteration.”

**Do:** show the tests or CI; only demonstrate a specific error message if you have verified it locally.

## 8:10–9:00 — Trade-offs and close

**Show:** `SOLUTION.md` and `README.md`.

**Say:**
> “I prioritised a complete, testable vertical slice: guarded sign-in, GraphQL-backed service discovery, service selection, scheduling, simulated payment hold, and persistent order details. The local GraphQL link means the assessment can run without deploying another service.”
>
> “For production, I would move the resolver and order persistence server-side, enforce idempotency transactionally, replace the demo session with real authentication, integrate a payment provider using tokenisation and webhooks, and strengthen error typing and observability.”
>
> “The key design choice is that the UI and domain workflows do not need to know whether GraphQL is backed by local fixtures or a remote API. That is the boundary I wanted to demonstrate.”

## Recording checklist

- Start in the IDE with the architecture; do not spend the first minute clicking through UI.
- Keep `schema.graphql`, `operations.graphql`, `local_order_link.dart`, and `graphql_order_repository.dart` in open tabs.
- Use a fresh order so the pending state can appear briefly; the four-second window is short.
- Confirm local checks and the exact UI behaviour before claiming them in narration.
- Be transparent that sign-in, payment, GraphQL transport, and persistence are simulated.
- Record the required narrated video separately; this script is not the video.
