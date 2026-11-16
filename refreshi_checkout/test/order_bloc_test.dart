import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:refreshi_checkout/domain/checkout/data/order_store.dart';
import 'package:refreshi_checkout/domain/checkout/repositories/order_repository.dart';
import 'package:refreshi_checkout/domain/orders/state_management/order_bloc.dart';
import 'package:refreshi_checkout/domain/orders/state_management/order_event.dart';
import 'package:refreshi_checkout/domain/orders/state_management/order_state.dart';
import 'package:refreshi_checkout/domain/orders/usecases/get_order.dart';

class FakeOrderRepository implements OrderRepository {
  FakeOrderRepository({this.order, this.fail = false});
  final CheckoutOrder? order;
  final bool fail;

  @override
  Future<CheckoutOrder?> find(String id) async {
    if (fail) throw StateError('Offline');
    return order?.id == id ? order : null;
  }

  @override
  Future<CheckoutOrder> create({
    required String requestId,
    required List<String> serviceIds,
    required DateTime scheduledAt,
    required int totalCents,
  }) => throw UnimplementedError();
}

void main() {
  final completed = CheckoutOrder(
    'RF-123',
    const ['office-refresh'],
    DateTime(2026, 11, 24, 9),
    4800,
    DateTime.now().subtract(const Duration(seconds: 10)),
  );

  blocTest<OrderBloc, OrderState>(
    'loads an existing order and its placed hold',
    build: () => OrderBloc(getOrder: GetOrder(FakeOrderRepository(order: completed))),
    act: (bloc) => bloc.add(const OrderEvent.loadRequested('RF-123')),
    verify: (bloc) {
      expect(bloc.state.status, OrderStatus.ready);
      expect(bloc.state.order?.id, 'RF-123');
      expect(bloc.state.order?.holdPlaced, isTrue);
    },
  );

  blocTest<OrderBloc, OrderState>(
    'shows a not-found state for an unknown order',
    build: () => OrderBloc(getOrder: GetOrder(FakeOrderRepository())),
    act: (bloc) => bloc.add(const OrderEvent.loadRequested('RF-missing')),
    verify: (bloc) {
      expect(bloc.state.status, OrderStatus.notFound);
      expect(bloc.state.error, 'Order not found.');
    },
  );

  blocTest<OrderBloc, OrderState>(
    'handles repository failures without exposing implementation details',
    build: () => OrderBloc(getOrder: GetOrder(FakeOrderRepository(fail: true))),
    act: (bloc) => bloc.add(const OrderEvent.loadRequested('RF-123')),
    verify: (bloc) {
      expect(bloc.state.status, OrderStatus.failure);
      expect(bloc.state.error, contains('Please retry'));
    },
  );
}
