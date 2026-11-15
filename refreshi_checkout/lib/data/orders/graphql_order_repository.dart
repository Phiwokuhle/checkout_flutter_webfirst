import 'package:graphql/client.dart';
import 'package:gql/language.dart';
import '../../domain/checkout/data/order_store.dart';
import '../../domain/checkout/repositories/order_repository.dart';
import '../graphql/generated/operations.graphql.dart';

class GraphqlOrderRepository implements OrderRepository {
  GraphqlOrderRepository(this.client);
  final GraphQLClient client;
  CheckoutOrder _map(String id,List<String> services,DateTime scheduled,int total,DateTime created)=>CheckoutOrder(id,services,scheduled,total,created);

  @override
  Future<CheckoutOrder> create({required String requestId,required List<String> serviceIds,required DateTime scheduledAt,required int totalCents})async{
    final result=await client.mutate(MutationOptions(
      document:parseString(r'''mutation CreateOrder($input: CreateOrderInput!) { createOrder(input: $input) { id serviceIds scheduledAt totalCents createdAt holdStatus } }'''),
      variables:{'input':{'requestId':requestId,'serviceIds':serviceIds,'scheduledAt':scheduledAt.toIso8601String(),'totalCents':totalCents,'cardToken':Uri.base.queryParameters['simulate']=='declined'?'tok_declined':Uri.base.queryParameters['simulate']=='timeout'?'tok_timeout':'tok_visa_4242'}},
      fetchPolicy:FetchPolicy.noCache,
    ));
    if(result.hasException||result.data==null)throw StateError('Order creation failed');
    final typed=Mutation$CreateOrder.fromJson(result.data!).createOrder;
    return _map(typed.id,typed.serviceIds,DateTime.parse(typed.scheduledAt),totalCents,DateTime.parse(typed.createdAt));
  }

  @override
  Future<CheckoutOrder?> find(String id)async{
    final result=await client.query(QueryOptions(
      document:parseString(r'''query GetOrder($id: ID!) { order(id: $id) { id serviceIds scheduledAt totalCents createdAt holdStatus } }'''),
      variables:{'id':id},
      fetchPolicy:FetchPolicy.noCache,
    ));
    if(result.hasException||result.data==null)throw StateError('Order fetch failed');
    final typed=Query$GetOrder.fromJson(result.data!).order;
    if(typed==null)return null;
    return _map(typed.id,typed.serviceIds,DateTime.parse(typed.scheduledAt),typed.totalCents,DateTime.parse(typed.createdAt));
  }
}
