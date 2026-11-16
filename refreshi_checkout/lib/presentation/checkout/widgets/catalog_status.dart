import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refreshi_checkout/domain/checkout/state_management/checkout_bloc.dart';
import 'package:refreshi_checkout/domain/checkout/state_management/checkout_event.dart';
import 'package:refreshi_checkout/domain/checkout/state_management/checkout_state.dart';
import 'package:refreshi_checkout/presentation/common/widgets/app_shimmer.dart';

class CatalogStatus extends StatelessWidget {
  const CatalogStatus({super.key, required this.state});
  final CheckoutState state;

  @override
  Widget build(BuildContext context) {
    if (state.status == CheckoutStatus.initial ||
        state.status == CheckoutStatus.loading) {
      return Column(children: [
        for (var i = 0; i < 3; i++) ...[
          const AppShimmer(height: 110),
          const SizedBox(height: 12),
        ],
      ]);
    }
    final failed = state.status == CheckoutStatus.failure;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (failed)
          Text(state.error ?? 'Unable to load services.',
              style: TextStyle(color: Theme.of(context).colorScheme.error))
        else
          const Text('No services are available right now.'),
        OutlinedButton(
          onPressed: () => context.read<CheckoutBloc>().add(const CheckoutEvent.started()),
          child: Text(failed ? 'Retry' : 'Refresh'),
        ),
      ],
    );
  }
}
