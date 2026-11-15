import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:graphql/client.dart';
import '../../data/graphql/local_order_link.dart';
import '../../data/checkout/graphql_service_catalog.dart';
import '../../data/orders/graphql_order_repository.dart';
import '../../domain/checkout/repositories/order_repository.dart';
import '../config/auth_session.dart';
import '../config/router.dart';
final getIt=GetIt.instance;
Future<void> configureDependencies()async{
 final prefs=await SharedPreferences.getInstance();
 getIt.registerSingleton<SharedPreferences>(prefs);
 getIt.registerLazySingleton<AuthSession>(()=>AuthSession(prefs));
 getIt.registerLazySingleton<GraphQLClient>(()=>GraphQLClient(link:LocalOrderLink(prefs),cache:GraphQLCache()));
 getIt.registerLazySingleton<GraphqlServiceCatalog>(()=>GraphqlServiceCatalog(getIt<GraphQLClient>()));
 getIt.registerLazySingleton<OrderRepository>(()=>GraphqlOrderRepository(getIt<GraphQLClient>()));
 getIt.registerLazySingleton<AppRouter>(()=>AppRouter(getIt<AuthSession>()));
}