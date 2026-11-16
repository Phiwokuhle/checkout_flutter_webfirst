import 'package:flutter/material.dart';
import 'package:refreshi_checkout/domain/checkout/data/order_store.dart';

class OrderTimeline extends StatelessWidget {
  const OrderTimeline({super.key, required this.order});
  final CheckoutOrder order;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Timeline', style: Theme.of(context).textTheme.titleLarge),
      const ListTile(
        leading: Icon(Icons.check_circle, color: Colors.teal),
        title: Text('Created'),
      ),
      ListTile(
        leading: Icon(
          order.holdPlaced ? Icons.check_circle : Icons.hourglass_top,
          color: order.holdPlaced ? Colors.teal : Colors.orange,
        ),
        title: Text(order.holdPlaced ? 'Hold Placed' : 'Hold Pending'),
      ),
    ],
  );
}
