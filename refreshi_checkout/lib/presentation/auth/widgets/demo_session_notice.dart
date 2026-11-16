import 'package:flutter/material.dart';
import 'package:refreshi_checkout/core/theme/app_theme.dart';

class DemoSessionNotice extends StatelessWidget {
  const DemoSessionNotice({super.key});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: AppColors.lavender,
      borderRadius: BorderRadius.circular(8),
    ),
    child: const Row(
      children: [
        Icon(Icons.verified_user_outlined, color: AppColors.primary),
        SizedBox(width: 12),
        Expanded(
          child: Text(
            'Demo session, No real credentials required',
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    ),
  );
}
