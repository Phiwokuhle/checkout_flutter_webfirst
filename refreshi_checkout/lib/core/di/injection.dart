import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/auth_session.dart';
import '../config/router.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  final preferences = await SharedPreferences.getInstance();

  getIt.registerSingleton<SharedPreferences>(preferences);

  getIt.registerLazySingleton<AuthSession>(
    () => AuthSession(getIt<SharedPreferences>()),
  );

  getIt.registerLazySingleton<AppRouter>(() => AppRouter(getIt<AuthSession>()));
}
