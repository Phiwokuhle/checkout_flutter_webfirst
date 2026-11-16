import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/service_model.dart';

part 'checkout_state.freezed.dart';

enum CheckoutStatus { initial, loading, ready, failure, submitting, success }

@freezed
class CheckoutState with _$CheckoutState {
  const CheckoutState._();
  const factory CheckoutState({
    @Default(CheckoutStatus.initial) CheckoutStatus status,
    @Default(<ServiceModel>[]) List<ServiceModel> services,
    @Default(<String>[]) List<String> selectedIds,
    DateTime? date,
    int? hour,
    int? minute,
    @Default(0) int totalCents,
    String? error,
    String? orderId,
  }) = _CheckoutState;

  DateTime? get scheduledAt {
    if (date == null || hour == null || minute == null) return null;
    return DateTime(date!.year, date!.month, date!.day, hour!, minute!);
  }
}
