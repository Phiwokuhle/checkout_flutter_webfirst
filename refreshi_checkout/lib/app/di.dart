import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';
import 'package:graphql/graphql.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../features/auth/domain/session_repository.dart';
import '../features/orders/data/local_graphql_link.dart';
import '../features/orders/data/graphql_order_repository.dart';
import '../features/orders/domain/order_repository.dart';
import '../features/checkout/presentation/checkout_cubit.dart';
final di=GetIt.instance;
Future<void> configureDependencies() async {
  final prefs=await SharedPreferences.getInstance();
  di.registerSingleton<SharedPreferences>(prefs);
  di.registerLazySingleton<SessionRepository>(()=>SessionRepository(di()));
  di.registerLazySingleton<GraphQLClient>(()=>GraphQLClient(link:LocalGraphqlLink(di()),cache:GraphQLCache()));
  di.registerLazySingleton<OrderRepository>(()=>GraphqlOrderRepository(di()));
  di.registerFactory<CheckoutCubit>(()=>CheckoutCubit(di(),di()));
}
