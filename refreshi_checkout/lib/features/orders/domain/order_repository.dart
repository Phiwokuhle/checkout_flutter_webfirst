import '../../../core/generated/checkout_models.g.dart';
abstract class OrderRepository {
  Future<GqlOrder> create(CreateOrderInput input);
  Future<GqlOrder?> find(String id);
}
