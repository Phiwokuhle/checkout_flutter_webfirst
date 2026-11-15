import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:graphql/graphql.dart';
import 'package:refreshi_checkout/features/orders/data/local_graphql_link.dart';
import 'package:refreshi_checkout/features/orders/data/graphql_order_repository.dart';
import 'package:refreshi_checkout/core/generated/checkout_models.g.dart';
void main() {
 TestWidgetsFlutterBinding.ensureInitialized();
 test('same idempotency key creates one order',() async {
   SharedPreferences.setMockInitialValues({});
   final prefs=await SharedPreferences.getInstance();
   final repository=GraphqlOrderRepository(GraphQLClient(link:LocalGraphqlLink(prefs),cache:GraphQLCache()));
   final input=CreateOrderInput(idempotencyKey:'test-idempotency-123',serviceIds:['clean'],scheduledAt:DateTime.now().add(const Duration(days:1)).toIso8601String(),cardToken:'tok_visa_4242');
   final a=await repository.create(input);
   final b=await repository.create(input);
   expect(a.id,b.id);
   expect(a.totalCents,35000);
 });
}
