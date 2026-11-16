import '../../checkout/data/order_store.dart';

/// Derives the next poll delay from the demo hold's four-second lifecycle.
class GetHoldRefreshDelay {
  const GetHoldRefreshDelay();

  Duration? call(CheckoutOrder order, DateTime now) {
    if (order.holdPlaced) return null;
    final elapsed = now.difference(order.created);
    final remaining = const Duration(seconds: 4) - elapsed;
    return remaining > Duration.zero ? remaining : const Duration(milliseconds: 100);
  }
}
