import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refreshi_checkout/core/config/za_format.dart';
import 'package:refreshi_checkout/domain/checkout/state_management/checkout_bloc.dart';
import 'package:refreshi_checkout/domain/checkout/state_management/checkout_event.dart';
import 'package:refreshi_checkout/domain/checkout/state_management/checkout_state.dart';

class ServiceSelection extends StatelessWidget {
  const ServiceSelection({super.key, required this.state});
  final CheckoutState state;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      for (final service in state.services) ...[
        Card(
          child: CheckboxListTile(
            value: state.selectedIds.contains(service.id),
            onChanged: state.status == CheckoutStatus.submitting
                ? null
                : (_) => context.read<CheckoutBloc>().add(
                    CheckoutEvent.serviceToggled(service.id)),
            title: Text(service.name),
            subtitle: Text(
              '${service.description} • ${service.durationMinutes} min • ${ZaFormat.money(service.priceCents)}',
            ),
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ),
        const SizedBox(height: 8),
      ],
    ],
  );
}
