import 'package:get_it/get_it.dart';
import 'package:refreshi_checkout/core/config/auth_session.dart';
import 'package:refreshi_checkout/core/config/router.dart';
import 'package:refreshi_checkout/data/checkout/graphql_service_catalog.dart';
import 'package:refreshi_checkout/data/graphql/local_order_link.dart';
import 'package:refreshi_checkout/data/orders/graphql_order_repository.dart';
import 'package:refreshi_checkout/domain/checkout/repositories/order_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:graphql/client.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(prefs);
  getIt.registerLazySingleton<AuthSession>(() => AuthSession(prefs));
  getIt.registerLazySingleton<GraphQLClient>(
    () => GraphQLClient(link: LocalOrderLink(prefs), cache: GraphQLCache()),
  );
  getIt.registerLazySingleton<GraphqlServiceCatalog>(
    () => GraphqlServiceCatalog(getIt<GraphQLClient>()),
  );
  getIt.registerLazySingleton<OrderRepository>(
    () => GraphqlOrderRepository(getIt<GraphQLClient>()),
  );
  getIt.registerLazySingleton<AppRouter>(() => AppRouter(getIt<AuthSession>()));
}
