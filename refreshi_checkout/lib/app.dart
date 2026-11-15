import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import 'core/theme/app_theme.dart';

class RefreshiApp extends StatelessWidget {
  const RefreshiApp({super.key, required this.router});

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp.router(
          title: 'Refreshi Checkout',
          debugShowCheckedModeBanner: false,
          theme: buildAppTheme(),
          routerConfig: router,
        );
      },
    );
  }
}
