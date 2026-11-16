import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refreshi_checkout/domain/orders/usecases/get_hold_refresh_delay.dart';
import 'package:refreshi_checkout/domain/orders/usecases/get_order.dart';
import 'order_event.dart';
import 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc({
    required GetOrder getOrder,
    GetHoldRefreshDelay refreshDelay = const GetHoldRefreshDelay(),
  }) : _getOrder = getOrder,
       _refreshDelay = refreshDelay,
       super(const OrderState()) {
    on<OrderLoadRequested>(_onLoad);
    on<OrderRefreshRequested>(_onRefresh);
  }

  final GetOrder _getOrder;
  final GetHoldRefreshDelay _refreshDelay;
  Timer? _timer;
  String? _activeOrderId;
  int _generation = 0;

  Future<void> _onLoad(OrderLoadRequested event, Emitter<OrderState> emit) async {
    _timer?.cancel();
    _activeOrderId = event.orderId;
    final generation = ++_generation;
    emit(const OrderState(status: OrderStatus.loading));
    await _fetch(event.orderId, generation, emit);
  }

  Future<void> _onRefresh(OrderRefreshRequested event, Emitter<OrderState> emit) async {
    if (event.orderId != _activeOrderId) return;
    final generation = ++_generation;
    await _fetch(event.orderId, generation, emit);
  }

  Future<void> _fetch(String id, int generation, Emitter<OrderState> emit) async {
    try {
      final order = await _getOrder(id);
      if (emit.isDone || generation != _generation || id != _activeOrderId) return;
      if (order == null) {
        emit(const OrderState(status: OrderStatus.notFound, error: 'Order not found.'));
        return;
      }
      emit(OrderState(status: OrderStatus.ready, order: order, holdPlaced: order.holdPlaced));
      _timer?.cancel();
      final delay = _refreshDelay(order, DateTime.now());
      if (delay != null) {
        _timer = Timer(delay, () {
          if (!isClosed && id == _activeOrderId) {
            add(OrderEvent.refreshRequested(id));
          }
        });
      }
    } catch (_) {
      if (emit.isDone || generation != _generation) return;
      emit(OrderState(
        status: OrderStatus.failure,
        error: 'Unable to load order. Please retry.',
        order: state.order,
      ));
    }
  }

  @override
  Future<void> close() async {
    _timer?.cancel();
    await super.close();
  }
}
