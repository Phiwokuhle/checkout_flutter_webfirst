# Refreshi assessment — narrated walkthrough (5–10 minutes)

## 0:00–1:00 — Scope
Introduce the Flutter web-first demo, three-step customer journey, South African rand pricing and in-app GraphQL architecture. Clarify that payments and sign-in are simulated.

## 1:00–2:30 — Sign-in and catalog
Show sign-in, select one or two services, demonstrate the maximum-two validation, and choose a future date and time. Confirm the order summary in ZAR.

## 2:30–4:00 — GraphQL and idempotency
Open `lib/data/graphql/schema.graphql`, `operations.graphql`, generated Dart models, `GraphqlOrderRepository`, `LocalOrderLink`, and `OrderStore`. Explain the resolver, token simulation and stable request IDs.

## 4:00–5:30 — Order timeline
Place an order, show Created → Hold Pending → Hold Placed, copy its clean `/orders/:orderId` URL and refresh. Explain local persistence and timestamp-derived hold status.

## 5:30–7:00 — Failure recovery
Demonstrate `/checkout?simulate=declined` and `/checkout?simulate=timeout`, then retry the normal URL. Show an unknown order ID and its recovery action.

## 7:00–8:30 — Quality and trade-offs
Show tests and CI output, explain UI/controller/repository separation, responsive layout, why SharedPreferences is suitable only for the demo, and the absence of real card charges.

## 8:30–9:00 — Wrap-up
Mention README setup, SOLUTION.md trade-offs, AI usage and remaining production considerations.

Record the narration and screen capture locally. This document is a recording outline, not a substitute for the required video.
