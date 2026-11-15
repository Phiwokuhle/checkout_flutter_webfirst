import 'dart:async';
import 'package:graphql/client.dart';
import 'package:gql/language.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/checkout/data/order_store.dart';
import 'local_graphql_fixtures.dart';

/// Local GraphQL resolver. No HTTP service or payment gateway is used.
class LocalOrderLink extends Link {
  LocalOrderLink(SharedPreferences preferences):_store=OrderStore(preferences);
  final OrderStore _store;
  final LocalGraphqlFixtures _fixtures = const LocalGraphqlFixtures();
  @override
  Stream<Response> request(Request request,[NextLink? forward]) async* {
    try {
      final operation=request.operation.operationName ?? (printNode(request.operation.document).contains('CreateOrder') ? 'CreateOrder' : 'GetOrder');
      if(operation=='GetServices'){
        final envelope=await _fixtures.load('GetServices');
        await Future<void>.delayed(const Duration(milliseconds:350));
        yield Response(response: const <String,dynamic>{},data:Map<String,dynamic>.from(envelope['data'] as Map));
      }else if(operation=='CreateOrder'){
        final input=Map<String,dynamic>.from(request.variables['input'] as Map);
        if(input['cardToken']=='tok_declined')throw StateError('The simulated card hold was declined. Please try again.');
        if(input['cardToken']=='tok_timeout'){await Future<void>.delayed(const Duration(seconds:2));throw TimeoutException('The simulated payment provider timed out. Please retry.');}
        if(input['cardToken']!='tok_visa_4242')throw StateError('Invalid demo card token');
        final order=await _store.create(
          input['requestId'] as String,
          List<String>.from(input['serviceIds'] as List),
          DateTime.parse(input['scheduledAt'] as String),
          input['totalCents'] as int,
        );
        final envelope=await _fixtures.load('CreateOrder');
        final data=Map<String,dynamic>.from(envelope['data'] as Map);
        final fixture=Map<String,dynamic>.from(data['createOrder'] as Map);
        yield Response(response: const <String,dynamic>{},data:{'__typename':'Mutation','createOrder':{...fixture,..._toGraphQL(order)}});
      }else if(operation=='GetOrder'){
        final order=await _store.find(request.variables['id'] as String);
        final envelope=await _fixtures.load('GetOrder');
        final data=Map<String,dynamic>.from(envelope['data'] as Map);
        final fixture=Map<String,dynamic>.from(data['order'] as Map);
        yield Response(response: const <String,dynamic>{},data:{'__typename':'Query','order':order==null?null:{...fixture,..._toGraphQL(order)}});
      }else{
        yield Response(response: const <String, dynamic>{}, errors:[GraphQLError(message:'Unsupported operation')]);
      }
    }catch(error){
      yield Response(response: const <String, dynamic>{}, errors:[GraphQLError(message:'Local order operation failed: '+error.toString())]);
    }
  }
  Map<String,dynamic> _toGraphQL(CheckoutOrder order)=>{
    '__typename':'Order',
    'id':order.id,
    'serviceIds':order.services,
    'scheduledAt':order.scheduled.toIso8601String(),
    'totalCents':order.total,
    'createdAt':order.created.toIso8601String(),
    'holdStatus':order.holdPlaced?'PLACED':'PENDING',
  };
}
