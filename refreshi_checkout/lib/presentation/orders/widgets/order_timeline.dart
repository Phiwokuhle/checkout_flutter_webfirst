import 'package:flutter/material.dart';
import 'package:refreshi_checkout/domain/checkout/data/order_store.dart';

class OrderTimeline extends StatelessWidget {
  const OrderTimeline({super.key, required this.order, required this.holdPlaced});
  final CheckoutOrder order;
  final bool holdPlaced;

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
          holdPlaced ? Icons.check_circle : Icons.hourglass_top,
          color: holdPlaced ? Colors.teal : Colors.orange,
        ),
        title: Text(holdPlaced ? 'Hold Placed' : 'Hold Pending'),
      ),
    ],
  );
}
