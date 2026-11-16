# Refreshi Checkout

A Flutter web-first checkout demonstration

## Setup

From `refreshi_checkout/`:

```sh
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter build web
flutter run -d chrome
```

Run on Android/iOS using `flutter run -d <device-id>` with an available emulator/simulator. Flutter 3.35+ required.

Sign in using a valid-looking email and any nonempty password. Select one or two services, schedule a future date/time, and confirm the simulated hold. The order route `/orders/:orderId` is protected by a demo session. A pending hold becomes placed after approximately four seconds; browser refresh restores the order from local storage.

GraphQL schema and operations are in `lib/data/graphql/`. `graphql_codegen` generates typed operation models into `lib/data/graphql/generated/`. No separate server or actual payment is involved.

See SOLUTION.md for design decisions and limitations.


## Local GraphQL backend simulation

Backend-shaped GraphQL response envelopes are bundled as JSON under `assets/graphql/`:

- `catalog.json`: `data.services` for the `GetServices` query.
- `create_order.json`: template for `data.createOrder`; request-specific values are resolved and persisted by the local GraphQL link.
- `get_order.json`: template for `data.order`; persisted order values and current hold status override the example values.

The checkout page calls `GraphqlServiceCatalog` through the same `GraphQLClient` used for orders, and handles loading, empty and error states. Prices come from the GraphQL response rather than UI constants. `LocalOrderLink` resolves the three operations using these files and `OrderStore` provides persistence and idempotency. The GraphQL schema and operation documents remain the source for generated models. To swap in a backend later, replace the local link with an HTTP GraphQL link while keeping the repository interface.

## Checkout state management

Checkout now uses `flutter_bloc` with separate Freezed `checkout_event.dart` and `checkout_state.dart` files. `CheckoutBloc` coordinates events and states only; catalog loading, selection rules, and order validation/submission live in independent use cases. The UI uses `BlocProvider`, `BlocBuilder`, and `BlocListener`. Run `dart run build_runner build --delete-conflicting-outputs` to generate the Freezed parts before analysis.
