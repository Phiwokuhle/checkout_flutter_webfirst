import 'package:graphql/client.dart';
import 'package:graphql/graphql.dart';
import '../../../core/generated/checkout_models.g.dart';
import '../domain/order_repository.dart';

const _create = r"""mutation CreateOrder($input: CreateOrderInput!) {
 createOrder(input: $input) { id idempotencyKey scheduledAt totalCents cardLast4 status services { id name priceCents durationMinutes } }
}""";
const _get = r"""query GetOrder($id: ID!) {
 order(id: $id) { id idempotencyKey scheduledAt totalCents cardLast4 status services { id name priceCents durationMinutes } }
}""";
class GraphqlOrderRepository implements OrderRepository {
  GraphqlOrderRepository(this.client);
  final GraphQLClient client;
  @override
  Future<GqlOrder> create(CreateOrderInput input) async {
    final result=await client.mutate(MutationOptions(document:gql(_create),variables:{'input':input.toJson()},fetchPolicy:FetchPolicy.noCache));
    if(result.hasException) throw StateError(result.exception.toString());
    return GqlOrder.fromJson(Map<String,dynamic>.from(result.data!['createOrder'] as Map));
  }
  @override
  Future<GqlOrder?> find(String id) async {
    final result=await client.query(QueryOptions(document:gql(_get),variables:{'id':id},fetchPolicy:FetchPolicy.noCache));
    if(result.hasException) throw StateError(result.exception.toString());
    final raw=result.data?['order'];
    return raw==null?null:GqlOrder.fromJson(Map<String,dynamic>.from(raw as Map));
  }
}
