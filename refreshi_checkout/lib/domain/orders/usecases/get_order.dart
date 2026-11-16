import '../../checkout/data/order_store.dart';
import '../../checkout/repositories/order_repository.dart';

class GetOrder {
  const GetOrder(this.repository);
  final OrderRepository repository;

  Future<CheckoutOrder?> call(String orderId) {
    if (orderId.trim().isEmpty) {
      throw const FormatException('An order ID is required.');
    }
    return repository.find(orderId);
  }
}
