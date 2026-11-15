import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/theme/app_theme.dart';

class AssessmentShell extends StatelessWidget {
  const AssessmentShell({super.key, required this.child, this.activeStep = 0});

  final Widget child;
  final int activeStep;

  static const steps = [
    'Sign In',
    'Catalog & Checkout',
    'Order Details',
    'Error States',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _header(context),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1180),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w.clamp(16.0, 64.0),
                        vertical: 32,
                      ),
                      child: child,
                    ),
                  ),
                ),
              ),
            ),
            _footer(),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final compact = constraints.maxWidth < 1100;

          return Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 24,
            runSpacing: 16,
            children: [
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.spa_outlined, color: AppColors.primary),
                  SizedBox(width: 10),
                  Text(
                    'Refreshi',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.ink,
                    ),
                  ),
                ],
              ),
              if (compact)
                Text(
                  steps[activeStep],
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                )
              else
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (var i = 0; i < steps.length; i++) ...[
                      Text(
                        '${i + 1}. ${steps[i]}',
                        style: TextStyle(
                          color: i == activeStep
                              ? AppColors.primary
                              : AppColors.muted,
                          fontWeight: i == activeStep
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      if (i < steps.length - 1)
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14),
                          child: Icon(
                            Icons.arrow_forward,
                            size: 14,
                            color: AppColors.muted,
                          ),
                        ),
                    ],
                  ],
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _footer() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      color: Colors.white,
      child: const Center(
        child: Text(
          'Refreshi Checkout Engine • Flutter Assessment',
          style: TextStyle(fontSize: 12, color: AppColors.muted),
        ),
      ),
    );
  }
}
