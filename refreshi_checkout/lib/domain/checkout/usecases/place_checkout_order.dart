import '../data/order_store.dart';
import '../repositories/order_repository.dart';

class PlaceCheckoutOrder {
  const PlaceCheckoutOrder(this.repository);
  final OrderRepository repository;

  Future<CheckoutOrder> call({
    required List<String> serviceIds,
    required DateTime? scheduledAt,
    required int totalCents,
    required String requestId,
  }) {
    if (serviceIds.isEmpty || serviceIds.length > 2 || scheduledAt == null ||
        !scheduledAt.isAfter(DateTime.now())) {
      throw const FormatException('Select services and a future date and time.');
    }
    if (totalCents <= 0) {
      throw const FormatException('Invalid order amount.');
    }
    return repository.create(
      requestId: requestId,
      serviceIds: [...serviceIds]..sort(),
      scheduledAt: scheduledAt,
      totalCents: totalCents,
    );
  }
}
