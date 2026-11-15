# Refreshi Checkout

A Flutter web-first checkout demonstration using South African rand (ZAR), a simulated saved Visa token and a local in-app GraphQL resolver.

## Setup

From `refreshi_checkout/`:

```sh
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
flutter run -d chrome
flutter build web
```

Run on Android/iOS using `flutter run -d <device-id>` with an available emulator/simulator. Flutter 3.35+ required.

Sign in using a valid-looking email and any nonempty password. Select one or two services, schedule a future date/time, and confirm the simulated hold. The order route `/orders/:orderId` is protected by a demo session. A pending hold becomes placed after approximately four seconds; browser refresh restores the order from local storage.

GraphQL schema and operations are in `lib/data/graphql/`. `graphql_codegen` generates typed operation models into `lib/data/graphql/generated/`. No separate server or actual payment is involved.

See SOLUTION.md for design decisions and limitations.

## Review checklist

- Use a South African rand total, choose one or two services, schedule a future time and place an order.
- Verify Created → Hold Pending → Hold Placed; refresh the order URL and confirm the same order returns.
- Open a copied `/orders/<id>` URL in a fresh browser session, sign in and confirm return to the original order.
- Check `/checkout?simulate=declined` and `/checkout?simulate=timeout` for recoverable error messages (remove the query parameter before retrying normally).
- Verify a missing order ID shows a retryable not-found state, and test a narrow viewport.
- Verify Android/iOS startup where devices are available.

The web app uses path-based URLs, so a static hosting provider must serve `index.html` for unknown application routes. The narrated 5–10 minute assessment walkthrough must be recorded separately.
