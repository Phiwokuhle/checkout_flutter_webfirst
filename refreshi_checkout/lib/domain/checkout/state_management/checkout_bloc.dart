import 'package:flutter_bloc/flutter_bloc.dart';
import '../usecases/load_checkout_catalog.dart';
import '../usecases/update_checkout_selection.dart';
import '../usecases/place_checkout_order.dart';
import 'checkout_event.dart';
import 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc({
    required LoadCheckoutCatalog loadCatalog,
    required PlaceCheckoutOrder placeOrder,
    UpdateCheckoutSelection selection = const UpdateCheckoutSelection(),
  }) : _loadCatalog = loadCatalog,
       _placeOrder = placeOrder,
       _selection = selection,
       super(const CheckoutState()) {
    on<CheckoutStarted>(_onStarted);
    on<CheckoutServiceToggled>(_onToggled);
    on<CheckoutDateChanged>(_onDateChanged);
    on<CheckoutTimeChanged>(_onTimeChanged);
    on<CheckoutSubmitted>(_onSubmitted);
  }

  final LoadCheckoutCatalog _loadCatalog;
  final PlaceCheckoutOrder _placeOrder;
  final UpdateCheckoutSelection _selection;
  String? _requestId;

  Future<void> _onStarted(CheckoutStarted event, Emitter<CheckoutState> emit) async {
    emit(state.copyWith(status: CheckoutStatus.loading, error: null));
    try {
      final services = await _loadCatalog();
      emit(state.copyWith(
        status: CheckoutStatus.ready,
        services: services,
        selectedIds: const [],
        totalCents: 0,
      ));
    } catch (_) {
      emit(state.copyWith(
        status: CheckoutStatus.failure,
        error: 'Unable to load services. Please retry.',
      ));
    }
  }

  void _onToggled(CheckoutServiceToggled event, Emitter<CheckoutState> emit) {
    if (state.status != CheckoutStatus.ready) return;
    final updated = _selection(
      catalog: state.services,
      selectedIds: state.selectedIds,
      toggledId: event.serviceId,
    );
    _requestId = null;
    emit(state.copyWith(
      selectedIds: updated.ids,
      totalCents: updated.totalCents,
      error: updated.error,
    ));
  }

  void _onDateChanged(CheckoutDateChanged event, Emitter<CheckoutState> emit) {
    if (state.status != CheckoutStatus.ready) return;
    _requestId = null;
    emit(state.copyWith(date: event.date, error: null));
  }

  void _onTimeChanged(CheckoutTimeChanged event, Emitter<CheckoutState> emit) {
    if (state.status != CheckoutStatus.ready) return;
    _requestId = null;
    emit(state.copyWith(hour: event.hour, minute: event.minute, error: null));
  }

  Future<void> _onSubmitted(CheckoutSubmitted event, Emitter<CheckoutState> emit) async {
    if (state.status != CheckoutStatus.ready) return;
    final snapshot = state;
    emit(state.copyWith(status: CheckoutStatus.submitting, error: null));
    try {
      _requestId ??= 'RF-${DateTime.now().microsecondsSinceEpoch}';
      final order = await _placeOrder(
        serviceIds: snapshot.selectedIds,
        scheduledAt: snapshot.scheduledAt,
        totalCents: snapshot.totalCents,
        requestId: _requestId!,
      );
      emit(state.copyWith(status: CheckoutStatus.success, orderId: order.id));
    } catch (error) {
      final message = error.toString().toLowerCase();
      final display = error is FormatException
          ? error.message
          : message.contains('declined')
              ? 'Your saved card could not be authorised. Please try again.'
              : message.contains('timeout') || message.contains('timed out')
                  ? 'The payment service took too long to respond. Please retry.'
                  : 'We could not place your order. Please retry.';
      emit(state.copyWith(status: CheckoutStatus.ready, error: display));
    }
  }
}
