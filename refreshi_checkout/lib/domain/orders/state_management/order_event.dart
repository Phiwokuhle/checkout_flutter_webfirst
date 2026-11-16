import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_event.freezed.dart';

@freezed
class OrderEvent with _$OrderEvent {
  const factory OrderEvent.loadRequested(String orderId) = OrderLoadRequested;
  const factory OrderEvent.refreshRequested(String orderId) = OrderRefreshRequested;
}
