import 'package:flutter/material.dart';

class SavedPaymentMethod extends StatelessWidget {
  const SavedPaymentMethod({super.key});

  @override
  Widget build(BuildContext context) => const Card(
    child: ListTile(
      leading: Icon(Icons.credit_card),
      title: Text('Visa ending in 4242'),
      subtitle: Text('Saved card token • simulated payment hold'),
    ),
  );
}
