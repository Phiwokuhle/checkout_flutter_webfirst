# Refreshi Checkout

A focused **web-first** Flutter checkout slice for the Senior Flutter Developer assessment. No external backend or real payment processing.

## Requirements
- Flutter 3.35+ / Dart 3.5+
- Chrome for web testing, or Android/iOS toolchain for mobile

## Run
```bash
flutter pub get
python3 tool/generate_graphql.py
flutter run -d chrome
```

For Android/iOS: `flutter run -d <device-id>`.

This archive intentionally does not include native generated scaffolding. Run `flutter create --platforms=android,ios,web .` once in this folder before running on a fresh machine; Flutter will create standard platform host files without replacing `lib/` or the app's dependencies. Then `flutter pub get` and `flutter run -d chrome`.

## Demo
1. Choose one or two services, select a future date/time, confirm.
2. On the order link, sign in using `demo@refreshi.co.za` / `demo` (any valid email and nonempty password).
3. Observe pending hold becoming confirmed after ~4 seconds.
4. Refresh the order URL, or open it in a new tab. Signed-out users are redirected to sign-in and back.
5. Try confirming twice; the same draft idempotency key resolves to one order.

## Layout
- `lib/features/checkout`: checkout UI + Cubit state
- `lib/features/orders/domain`: repository contract
- `lib/features/orders/data`: GraphQL adapter and in-process local link
- `lib/features/orders/presentation`: order status timeline
- `lib/features/auth`: simulated session
- `lib/core/generated`: typed GraphQL models
- `graphql/`: schema and operations

**Important:** This package was created in an environment without Flutter/Dart installed. Static review was performed, but `flutter analyze`, builds and runtime tests could not be executed here. See SOLUTION.md for implementation limitations.
