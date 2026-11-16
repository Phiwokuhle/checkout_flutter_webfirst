import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout_event.freezed.dart';

@freezed
class CheckoutEvent with _$CheckoutEvent {
  const factory CheckoutEvent.started() = CheckoutStarted;
  const factory CheckoutEvent.serviceToggled(String serviceId) = CheckoutServiceToggled;
  const factory CheckoutEvent.dateChanged(DateTime date) = CheckoutDateChanged;
  const factory CheckoutEvent.timeChanged(int hour, int minute) = CheckoutTimeChanged;
  const factory CheckoutEvent.submitted() = CheckoutSubmitted;
}
