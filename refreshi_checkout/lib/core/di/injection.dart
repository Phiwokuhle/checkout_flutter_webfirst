import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/checkout/data/order_store.dart';
import '../config/auth_session.dart';
import '../config/router.dart';
final getIt=GetIt.instance;
Future<void> configureDependencies()async{
 final prefs=await SharedPreferences.getInstance();
 getIt.registerSingleton<SharedPreferences>(prefs);
 getIt.registerLazySingleton<AuthSession>(()=>AuthSession(prefs));
 getIt.registerLazySingleton<OrderStore>(()=>OrderStore(prefs));
 getIt.registerLazySingleton<AppRouter>(()=>AppRouter(getIt<AuthSession>()));
}