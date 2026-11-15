import 'package:flutter_test/flutter_test.dart';
import 'package:refreshi_checkout/domain/checkout/data/order_store.dart';
import 'package:refreshi_checkout/domain/checkout/data/service_model.dart';
import 'package:refreshi_checkout/domain/checkout/repositories/order_repository.dart';
import 'package:refreshi_checkout/domain/checkout/state_management/checkout_cubit.dart';

class FakeOrders implements OrderRepository {
  int creates = 0;
  @override
  Future<CheckoutOrder> create({required String requestId,required List<String> serviceIds,required DateTime scheduledAt,required int totalCents}) async {
    creates++;
    return CheckoutOrder(requestId,serviceIds,scheduledAt,totalCents,DateTime.now());
  }
  @override
  Future<CheckoutOrder?> find(String id) async => null;
}

void setUpCatalog(CheckoutController controller) {
  controller.setCatalog(const [
    ServiceModel(id:'office-refresh',name:'Office',description:'Office',durationMinutes:60,priceCents:4800),
    ServiceModel(id:'hepa-decontamination',name:'HEPA',description:'HEPA',durationMinutes:90,priceCents:8500),
    ServiceModel(id:'duct-treatment',name:'Duct',description:'Duct',durationMinutes:45,priceCents:12000),
  ]);
}

void main() {
  test('checkout accepts no more than two services', () {
    final controller=CheckoutController(FakeOrders());
    setUpCatalog(controller);
    controller.toggle('office-refresh');
    controller.toggle('hepa-decontamination');
    controller.toggle('duct-treatment');
    expect(controller.selected.length,2);
    expect(controller.totalCents,13300);
    expect(controller.error,contains('two'));
    controller.dispose();
  });

  test('checkout rejects missing schedule without creating order', () async {
    final orders=FakeOrders();
    final controller=CheckoutController(orders);
    setUpCatalog(controller);
    controller.toggle('office-refresh');
    expect(await controller.submit(),isNull);
    expect(orders.creates,0);
    controller.dispose();
  });

  test('checkout creates an order with a future schedule', () async {
    final orders=FakeOrders();
    final controller=CheckoutController(orders);
    final future=DateTime.now().add(const Duration(days:3));
    controller.toggle('office-refresh');
    controller.setDate(future);
    controller.setTime(9,0);
    final order=await controller.submit();
    expect(order?.total,4800);
    expect(orders.creates,1);
    controller.dispose();
  });
}
