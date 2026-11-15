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

GraphQL schema and operations are in `graphql/`. `graphql_codegen` generates typed operation models into `lib/data/graphql/generated/`. No separate server or actual payment is involved.

See SOLUTION.md for design decisions and limitations.
