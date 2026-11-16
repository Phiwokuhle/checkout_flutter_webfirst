import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refreshi_checkout/core/config/za_format.dart';
import 'package:refreshi_checkout/domain/checkout/state_management/checkout_bloc.dart';
import 'package:refreshi_checkout/domain/checkout/state_management/checkout_event.dart';
import 'package:refreshi_checkout/domain/checkout/state_management/checkout_state.dart';

class CheckoutSummary extends StatelessWidget {
  const CheckoutSummary({super.key, required this.state});
  final CheckoutState state;

  @override
  Widget build(BuildContext context) {
    final busy = state.status == CheckoutStatus.submitting;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Total: ${ZaFormat.money(state.totalCents)}',
            style: Theme.of(context).textTheme.titleLarge),
        if (state.error != null) ...[
          const SizedBox(height: 12),
          Text(state.error!,
              style: TextStyle(color: Theme.of(context).colorScheme.error)),
        ],
        const SizedBox(height: 18),
        FilledButton(
          onPressed: busy
              ? null
              : () => context.read<CheckoutBloc>().add(const CheckoutEvent.submitted()),
          child: Text(busy ? 'Placing order…' : 'Confirm & place hold'),
        ),
      ],
    );
  }
}
