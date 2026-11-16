import 'package:flutter/material.dart';
import 'package:refreshi_checkout/core/config/za_format.dart';
import 'package:refreshi_checkout/domain/checkout/data/order_store.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({super.key, required this.order});
  final CheckoutOrder order;

  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order ${order.id}', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Text('Scheduled: ${ZaFormat.schedule(order.scheduled)}'),
          Text('Services: ${order.services.map(ZaFormat.serviceName).join(', ')}'),
          Text('Total: ${ZaFormat.money(order.total)}'),
        ],
      ),
    ),
  );
}
