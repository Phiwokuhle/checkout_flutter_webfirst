import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:refreshi_checkout/domain/checkout/data/order_store.dart';
import 'package:refreshi_checkout/domain/checkout/data/service_model.dart';
import 'package:refreshi_checkout/domain/checkout/repositories/order_repository.dart';
import 'package:refreshi_checkout/domain/checkout/repositories/service_catalog_repository.dart';
import 'package:refreshi_checkout/domain/checkout/state_management/checkout_bloc.dart';
import 'package:refreshi_checkout/domain/checkout/state_management/checkout_event.dart';
import 'package:refreshi_checkout/domain/checkout/state_management/checkout_state.dart';
import 'package:refreshi_checkout/domain/checkout/usecases/load_checkout_catalog.dart';
import 'package:refreshi_checkout/domain/checkout/usecases/place_checkout_order.dart';

class FakeOrders implements OrderRepository {
  int creates = 0;
  @override
  Future<CheckoutOrder> create({
    required String requestId,
    required List<String> serviceIds,
    required DateTime scheduledAt,
    required int totalCents,
  }) async {
    creates++;
    return CheckoutOrder(requestId, serviceIds, scheduledAt, totalCents, DateTime.now());
  }
  @override
  Future<CheckoutOrder?> find(String id) async => null;
}

class FakeCatalog implements ServiceCatalogRepository {
  @override
  Future<List<ServiceModel>> load() async => const [
    ServiceModel(id: 'office-refresh', name: 'Office', description: 'Office', durationMinutes: 60, priceCents: 4800),
    ServiceModel(id: 'hepa-decontamination', name: 'HEPA', description: 'HEPA', durationMinutes: 90, priceCents: 8500),
    ServiceModel(id: 'duct-treatment', name: 'Duct', description: 'Duct', durationMinutes: 45, priceCents: 12000),
  ];
}

CheckoutBloc buildBloc(FakeOrders orders) => CheckoutBloc(
  loadCatalog: LoadCheckoutCatalog(FakeCatalog()),
  placeOrder: PlaceCheckoutOrder(orders),
);

void main() {
  blocTest<CheckoutBloc, CheckoutState>(
    'loads catalog through the use case',
    build: () => buildBloc(FakeOrders()),
    act: (bloc) => bloc.add(const CheckoutEvent.started()),
    verify: (bloc) {
      expect(bloc.state.status, CheckoutStatus.ready);
      expect(bloc.state.services, hasLength(3));
    },
  );

  blocTest<CheckoutBloc, CheckoutState>(
    'enforces two-service maximum and calculates ZAR cents',
    build: () => buildBloc(FakeOrders()),
    act: (bloc) async {
      bloc.add(const CheckoutEvent.started());
      await bloc.stream.firstWhere((state) => state.status == CheckoutStatus.ready);
      bloc.add(const CheckoutEvent.serviceToggled('office-refresh'));
      bloc.add(const CheckoutEvent.serviceToggled('hepa-decontamination'));
      bloc.add(const CheckoutEvent.serviceToggled('duct-treatment'));
    },
    verify: (bloc) {
      expect(bloc.state.selectedIds, hasLength(2));
      expect(bloc.state.totalCents, 13300);
      expect(bloc.state.error, contains('two'));
    },
  );

  blocTest<CheckoutBloc, CheckoutState>(
    'rejects checkout without schedule',
    build: () => buildBloc(FakeOrders()),
    act: (bloc) async {
      bloc.add(const CheckoutEvent.started());
      await bloc.stream.firstWhere((state) => state.status == CheckoutStatus.ready);
      bloc.add(const CheckoutEvent.serviceToggled('office-refresh'));
      bloc.add(const CheckoutEvent.submitted());
    },
    verify: (bloc) {
      expect(bloc.state.status, CheckoutStatus.ready);
      expect(bloc.state.error, contains('future date'));
    },
  );
}
