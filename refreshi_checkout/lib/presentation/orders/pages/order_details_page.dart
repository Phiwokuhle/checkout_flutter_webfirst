import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:refreshi_checkout/core/config/route_names.dart';
import 'package:refreshi_checkout/core/di/injection.dart';
import 'package:refreshi_checkout/domain/checkout/repositories/order_repository.dart';
import 'package:refreshi_checkout/domain/orders/state_management/order_controller.dart';
import 'package:refreshi_checkout/presentation/common/widgets/app_shell.dart';
import 'package:refreshi_checkout/presentation/common/widgets/app_shimmer.dart';
import 'package:refreshi_checkout/presentation/orders/widgets/order_summary_card.dart';
import 'package:refreshi_checkout/presentation/orders/widgets/order_timeline.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({super.key, required this.orderId});
  final String orderId;

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  late final OrderController controller;

  @override
  void initState() {
    super.initState();
    controller = OrderController(getIt<OrderRepository>());
    controller.load(widget.orderId);
  }

  @override
  void didUpdateWidget(covariant OrderDetailsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.orderId != widget.orderId) controller.load(widget.orderId);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AssessmentShell(
    activeStep: 2,
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 760),
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, _) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Order Details', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 24),
            if (controller.loading) ...[
              const AppShimmer(height: 120),
              const SizedBox(height: 16),
              const AppShimmer(height: 160),
            ] else if (controller.error != null) ...[
              Text(controller.error!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error)),
              OutlinedButton(
                onPressed: () => controller.load(widget.orderId),
                child: const Text('Retry'),
              ),
            ] else if (controller.order != null) ...[
              OrderSummaryCard(order: controller.order!),
              const SizedBox(height: 20),
              OrderTimeline(order: controller.order!),
              const SizedBox(height: 12),
              SelectableText(
                'Order link: ${Uri.base.origin}${RoutePaths.order(controller.order!.id)}',
              ),
            ],
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () => context.go(RoutePaths.checkout),
              child: const Text('Back to checkout'),
            ),
          ],
        ),
      ),
    ),
  );
}
