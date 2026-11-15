import '../data/order_store.dart';
abstract class OrderRepository {
  Future<CheckoutOrder> create({required String requestId,required List<String> serviceIds,required DateTime scheduledAt,required int totalCents});
  Future<CheckoutOrder?> find(String id);
}
