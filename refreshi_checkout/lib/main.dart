import 'package:flutter/material.dart';

import 'app.dart';
import 'core/config/router.dart';
import 'core/di/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(RefreshiApp(router: getIt<AppRouter>().router));
}
