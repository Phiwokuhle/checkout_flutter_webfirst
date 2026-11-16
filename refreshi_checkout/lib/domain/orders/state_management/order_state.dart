import 'package:freezed_annotation/freezed_annotation.dart';
import '../../checkout/data/order_store.dart';

part 'order_state.freezed.dart';

enum OrderStatus { initial, loading, ready, notFound, failure }

@freezed
class OrderState with _$OrderState {
  const factory OrderState({
    @Default(OrderStatus.initial) OrderStatus status,
    CheckoutOrder? order,
    String? error,
  }) = _OrderState;
}
