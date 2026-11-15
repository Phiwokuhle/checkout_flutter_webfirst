# Solution notes

The checkout uses go_router, session guards, shareable order URLs, a local persisted order store, an idempotent request ID, and a delayed hold confirmation. Loading uses shimmers; failed order loads can be retried.

## Known limitations

This branch does not yet meet the assessment's typed GraphQL client and generated operations requirement. The order store uses SharedPreferences, not an in-app GraphQL link. No real payment processing occurs. Browser storage is device-local. Run flutter analyze, flutter test and flutter build web before submission.

## AI usage

AI assistance was used for planning and implementation drafts. Local compilation and manual verification remain required.
