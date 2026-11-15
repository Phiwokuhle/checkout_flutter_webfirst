import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../app/di.dart';
import '../../../core/catalog.dart';
import '../../../core/ui.dart';
import 'checkout_cubit.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override Widget build(BuildContext context) =>
      BlocProvider(
          create: (_) => di<CheckoutCubit>(), child: const _CheckoutView());
}

class _CheckoutView extends StatelessWidget {
  const _CheckoutView();

  Future<void> _pickDate(BuildContext context, CheckoutCubit cubit) async {
    final now = DateTime.now();
    final day = await showDatePicker(context: context,
        initialDate: now.add(const Duration(days: 1)),
        firstDate: now,
        lastDate: now.add(const Duration(days: 90)));
    if (day == null || !context.mounted) return;
    final time = await showTimePicker(
        context: context, initialTime: const TimeOfDay(hour: 10, minute: 0));
    if (time == null || !context.mounted) return;
    cubit.schedule(
        DateTime(day.year, day.month, day.day, time.hour, time.minute));
  }

  @override Widget build(BuildContext context) =>
      PageFrame(child: BlocBuilder<CheckoutCubit, CheckoutState>(
          builder: (context, state) {
            final cubit = context.read<CheckoutCubit>();
            final selected = catalog
                .where((s) => state.selected.contains(s.id))
                .toList();
            final total = selected.fold<int>(0, (sum, s) => sum + s.priceCents);
            final catalogWidget = Column(
                crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Text('Book a service', style: Theme
                  .of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontWeight: FontWeight.w700)),
              const SizedBox(height: 6),
              const Text('Choose one or two services, then pick a time.'),
              const SizedBox(height: 22),
              ...catalog.map((service) {
                final checked = state.selected.contains(service.id);
                return Padding(padding: const EdgeInsets.only(bottom: 12),
                    child: Card(child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: state.submitting ? null : () =>
                            cubit.toggle(service.id),
                        child: Padding(padding: const EdgeInsets.all(18),
                            child: Row(children: [
                              Icon(checked ? Icons.check_circle : Icons
                                  .circle_outlined, color: checked ? Theme
                                  .of(context)
                                  .colorScheme
                                  .primary : Colors.grey),
                              const SizedBox(width: 14),
                              Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(service.name, style: Theme
                                        .of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                        fontWeight: FontWeight.w600)),
                                    const SizedBox(height: 4),
                                    Text(service.description, style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodySmall),
                                    const SizedBox(height: 4),
                                    Text('${service.durationMinutes} min',
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .labelSmall)
                                  ])),
                              const SizedBox(width: 12),
                              Text(zar(service.priceCents),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700))
                            ])))));
              }),
              const SizedBox(height: 18),
              Text('Schedule', style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge),
              const SizedBox(height: 12),
              OutlinedButton.icon(onPressed: state.submitting ? null : () =>
                  _pickDate(context, cubit),
                  icon: const Icon(Icons.calendar_month_outlined),
                  label: Text(state.schedule == null
                      ? 'Choose date and time'
                      : dateLabel(state.schedule!))),
            ]);
            final summary = Card(child: Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                  Text('Order summary', style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge),
                  const SizedBox(height: 18),
                  if(selected.isEmpty)const Text('No services selected yet.'),
                  ...selected.map((s) =>
                      Padding(padding: const EdgeInsets.symmetric(vertical: 7),
                          child: Row(children: [
                            Expanded(child: Text(s.name)),
                            Text(zar(s.priceCents))
                          ])),
                      const Divider(height: 30),
                      Row(children: [
                        const Expanded(child: Text('Total', style: TextStyle(
                            fontWeight: FontWeight.bold))),
                        Text(zar(total),
                            style: const TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 20))
                      ]),
                      const SizedBox(height: 20),
                      const Row(children: [
                        Icon(Icons.credit_card, size: 20),
                        SizedBox(width: 10),
                        Text('Visa •••• 4242')
                      ]),
                      const SizedBox(height: 6),
                      const Text('Simulated saved card token',
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                      const SizedBox(height: 22),
                      if(state.error!=null)
                  Padding(padding: const EdgeInsets.only(bottom: 12),
                      child: Text(state.error!, style: TextStyle(color: Theme
                          .of(context)
                          .colorScheme
                          .error))),
                  FilledButton(
                      onPressed: state.submitting || selected.isEmpty ||
                          state.schedule == null ? null : () async {
                        try {
                          final order = await cubit.confirm();
                          if (context.mounted) context.go('/orders/${order
                              .id}');
                        } catch (_) {
                          /* Error displayed by cubit. */
                        }
                      },
                      child: Text(state.submitting
                          ? 'Creating order…'
                          : 'Confirm booking')),
                ])));
            return LayoutBuilder(builder: (context, constraints) =>
            constraints.maxWidth >= 800
                ? Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 6, child: catalogWidget),
                  const SizedBox(width: 28),
                  Expanded(flex: 4, child: summary)
                ])
                : ListView(children: [
              catalogWidget,
              const SizedBox(height: 22),
              summary
            ]));
          }));
}
