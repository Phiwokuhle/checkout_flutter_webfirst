import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refreshi_checkout/domain/checkout/state_management/checkout_bloc.dart';
import 'package:refreshi_checkout/domain/checkout/state_management/checkout_event.dart';
import 'package:refreshi_checkout/domain/checkout/state_management/checkout_state.dart';

class SchedulePicker extends StatelessWidget {
  const SchedulePicker({super.key, required this.state});
  final CheckoutState state;

  @override
  Widget build(BuildContext context) {
    final busy = state.status == CheckoutStatus.submitting;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Schedule', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            OutlinedButton.icon(
              icon: const Icon(Icons.calendar_today),
              label: Text(state.date == null
                  ? 'Choose date'
                  : 'Date: ${state.date!.day}/${state.date!.month}/${state.date!.year}'),
              onPressed: busy ? null : () async {
                final bloc = context.read<CheckoutBloc>();
                final date = await showDatePicker(
                  context: context,
                  initialDate: state.date ?? DateTime.now().add(const Duration(days: 1)),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (date != null && context.mounted) {
                  bloc.add(CheckoutEvent.dateChanged(date));
                }
              },
            ),
            OutlinedButton.icon(
              icon: const Icon(Icons.schedule),
              label: Text(state.hour == null
                  ? 'Choose time'
                  : TimeOfDay(hour: state.hour!, minute: state.minute!).format(context)),
              onPressed: busy ? null : () async {
                final bloc = context.read<CheckoutBloc>();
                final time = await showTimePicker(
                  context: context,
                  initialTime: const TimeOfDay(hour: 9, minute: 0),
                );
                if (time != null && context.mounted) {
                  bloc.add(CheckoutEvent.timeChanged(time.hour, time.minute));
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
