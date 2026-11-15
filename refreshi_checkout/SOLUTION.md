# Refreshi solution

## Architecture

- Presentation: small Flutter screens and reusable widgets.
- Application state: `CheckoutController` and `OrderController` expose state and coordinate asynchronous work; widgets do not call the order store.
- Domain: `OrderRepository` contract and `CheckoutOrder` model.
- Data: `GraphqlOrderRepository` invokes typed generated GraphQL response models; `LocalOrderLink` resolves `CreateOrder` and `GetOrder` operations in-process. `OrderStore` persists to SharedPreferences.
- Navigation: go_router supports order deep links, simulated sign-in guards and redirect-back.
- Money: prices are integer cents, displayed in ZAR (R). The saved Visa token is a non-sensitive mock value.

## Robustness and trade-offs

A submission key is reused for retries while the checkout selection and schedule remain unchanged. The submit button is disabled while pending, and the local store deduplicates repeated request IDs including overlapping calls on the same store instance. Order records persist across browser refresh, and hold status derives from a persisted creation timestamp. This is a deterministic simulation, not a financial ledger. Separate tabs or separate devices are not guaranteed transactional idempotency. A real system would enforce uniqueness server-side.

The in-app GraphQL link avoids a separate backend, while generated response models demonstrate typed operation boundaries. SharedPreferences is not secure payment storage; the card is simulated. The application does not perform real charges.

## Verification

Run `flutter analyze`, `flutter test`, and `flutter build web` after code generation. Tests cover repeated request IDs and recovery using a new store instance. Manually verify deep-link sign-in return, refresh, pending-to-placed transition, narrow viewport and Android/iOS startup. These commands have not been executed by the AI environment; results must be recorded after local verification.

## AI usage

ChatGPT (OpenAI) was used for planning, code drafting, architecture review and debugging guidance. Accepted output included the go_router session redirect and the initial local order-store design. Revised output included replacing direct StatefulWidget order operations with application controllers, adding a GraphQL boundary, and replacing USD formatting with South African rand. An earlier hand-written GraphQL model approach was rejected because the assessment explicitly requires code generation. AI-generated changes require verification through the commands above and manual checkout journeys before submission.
