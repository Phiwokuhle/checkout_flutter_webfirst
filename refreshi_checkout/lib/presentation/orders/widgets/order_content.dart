import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:refreshi_checkout/core/config/route_names.dart';
import 'package:refreshi_checkout/domain/orders/state_management/order_bloc.dart';
import 'package:refreshi_checkout/domain/orders/state_management/order_event.dart';
import 'package:refreshi_checkout/domain/orders/state_management/order_state.dart';
import 'package:refreshi_checkout/presentation/common/widgets/app_shimmer.dart';
import 'order_summary_card.dart';
import 'order_timeline.dart';

class OrderContent extends StatelessWidget {
  const OrderContent({super.key, required this.orderId, required this.state});

  final String orderId;
  final OrderState state;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text('Order Details', style: Theme.of(context).textTheme.headlineMedium),
      const SizedBox(height: 24),
      if (state.status == OrderStatus.initial ||
          state.status == OrderStatus.loading) ...[
        const AppShimmer(height: 120),
        const SizedBox(height: 16),
        const AppShimmer(height: 160),
      ] else if (state.status == OrderStatus.failure ||
          state.status == OrderStatus.notFound) ...[
        Text(
          state.error ?? 'Unable to load order.',
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
        OutlinedButton(
          onPressed: () => context.read<OrderBloc>().add(
                OrderEvent.loadRequested(orderId),
              ),
          child: const Text('Retry'),
        ),
      ] else if (state.order != null) ...[
        OrderSummaryCard(order: state.order!),
        const SizedBox(height: 20),
        OrderTimeline(order: state.order!),
        const SizedBox(height: 12),
        SelectableText(
          'Order link: ${Uri.base.origin}${RoutePaths.order(state.order!.id)}',
        ),
      ],
      const SizedBox(height: 20),
      OutlinedButton(
        onPressed: () => context.go(RoutePaths.checkout),
        child: const Text('Back to checkout'),
      ),
    ],
  );
}
