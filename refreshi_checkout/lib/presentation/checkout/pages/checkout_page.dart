import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:refreshi_checkout/core/config/route_names.dart';
import 'package:refreshi_checkout/core/config/za_format.dart';
import 'package:refreshi_checkout/core/di/injection.dart';
import 'package:refreshi_checkout/data/checkout/graphql_service_catalog.dart';
import 'package:refreshi_checkout/domain/checkout/repositories/order_repository.dart';
import 'package:refreshi_checkout/domain/checkout/state_management/checkout_bloc.dart';
import 'package:refreshi_checkout/domain/checkout/state_management/checkout_event.dart';
import 'package:refreshi_checkout/domain/checkout/state_management/checkout_state.dart';
import 'package:refreshi_checkout/domain/checkout/usecases/load_checkout_catalog.dart';
import 'package:refreshi_checkout/domain/checkout/usecases/place_checkout_order.dart';
import 'package:refreshi_checkout/presentation/common/widgets/app_shell.dart';
import 'package:refreshi_checkout/presentation/common/widgets/app_shimmer.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => CheckoutBloc(
      loadCatalog: LoadCheckoutCatalog(getIt<GraphqlServiceCatalog>()),
      placeOrder: PlaceCheckoutOrder(getIt<OrderRepository>()),
    )..add(const CheckoutEvent.started()),
    child: const _CheckoutView(),
  );
}

class _CheckoutView extends StatelessWidget {
  const _CheckoutView();

  @override
  Widget build(BuildContext context) => BlocListener<CheckoutBloc, CheckoutState>(
    listenWhen: (previous, current) =>
        previous.status != CheckoutStatus.success &&
        current.status == CheckoutStatus.success,
    listener: (context, state) {
      if (state.orderId != null) context.go(RoutePaths.order(state.orderId!));
    },
    child: AssessmentShell(
      activeStep: 1,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 780),
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            final bloc = context.read<CheckoutBloc>();
            final busy = state.status == CheckoutStatus.submitting;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Catalog & Checkout',
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 8),
                const Text('Choose one or two services and a convenient time.'),
                const SizedBox(height: 24),
                if (state.status == CheckoutStatus.initial ||
                    state.status == CheckoutStatus.loading)
                  for (var i = 0; i < 3; i++) ...[
                    const AppShimmer(height: 110),
                    const SizedBox(height: 12),
                  ]
                else if (state.status == CheckoutStatus.failure) ...[
                  Text(state.error ?? 'Unable to load services.',
                      style: TextStyle(color: Theme.of(context).colorScheme.error)),
                  OutlinedButton(
                    onPressed: () => bloc.add(const CheckoutEvent.started()),
                    child: const Text('Retry'),
                  ),
                ] else if (state.services.isEmpty) ...[
                  const Text('No services are available right now.'),
                  OutlinedButton(
                    onPressed: () => bloc.add(const CheckoutEvent.started()),
                    child: const Text('Refresh'),
                  ),
                ] else ...[
                  for (final service in state.services) ...[
                    Card(
                      child: CheckboxListTile(
                        value: state.selectedIds.contains(service.id),
                        onChanged: busy
                            ? null
                            : (_) => bloc.add(CheckoutEvent.serviceToggled(service.id)),
                        title: Text(service.name),
                        subtitle: Text(
                          '${service.description} • ${service.durationMinutes} min • ${ZaFormat.money(service.priceCents)}',
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                  const SizedBox(height: 20),
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
                        onPressed: busy
                            ? null
                            : () async {
                                final date = await showDatePicker(
                                  context: context,
                                  initialDate: state.date ??
                                      DateTime.now().add(const Duration(days: 1)),
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
                            : TimeOfDay(hour: state.hour!, minute: state.minute!)
                                .format(context)),
                        onPressed: busy
                            ? null
                            : () async {
                                final time = await showTimePicker(
                                  context: context,
                                  initialTime: const TimeOfDay(hour: 9, minute: 0),
                                );
                                if (time != null && context.mounted) {
                                  bloc.add(CheckoutEvent.timeChanged(
                                      time.hour, time.minute));
                                }
                              },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Card(
                    child: ListTile(
                      leading: Icon(Icons.credit_card),
                      title: Text('Visa ending in 4242'),
                      subtitle: Text('Saved card token • simulated payment hold'),
                    ),
                  ),
                  const SizedBox(height: 16),
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
                        : () => bloc.add(const CheckoutEvent.submitted()),
                    child: Text(busy ? 'Placing order…' : 'Confirm & place hold'),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    ),
  );
}
