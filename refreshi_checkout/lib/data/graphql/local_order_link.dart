import 'dart:async';
import 'package:graphql/client.dart';
import 'package:gql/language.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/checkout/data/order_store.dart';

/// Local GraphQL resolver. No HTTP service or payment gateway is used.
class LocalOrderLink extends Link {
  LocalOrderLink(SharedPreferences preferences):_store=OrderStore(preferences);
  final OrderStore _store;
  @override
  Stream<Response> request(Request request,[NextLink? forward]) async* {
    try {
      final operation=request.operation.operationName ?? (printNode(request.operation.document).contains('CreateOrder') ? 'CreateOrder' : 'GetOrder');
      if(operation=='CreateOrder'){
        final input=Map<String,dynamic>.from(request.variables['input'] as Map);
        if(input['cardToken']!='tok_visa_4242')throw StateError('Invalid demo card token');
        final order=await _store.create(
          input['requestId'] as String,
          List<String>.from(input['serviceIds'] as List),
          DateTime.parse(input['scheduledAt'] as String),
          input['totalCents'] as int,
        );
        yield Response(response: const <String, dynamic>{}, data:{'createOrder':_toGraphQL(order)});
      }else if(operation=='GetOrder'){
        final order=await _store.find(request.variables['id'] as String);
        yield Response(response: const <String, dynamic>{}, data:{'order':order==null?null:_toGraphQL(order)});
      }else{
        yield Response(response: const <String, dynamic>{}, errors:[GraphQLError(message:'Unsupported operation')]);
      }
    }catch(error){
      yield Response(response: const <String, dynamic>{}, errors:[GraphQLError(message:'Local order operation failed: '+error.toString())]);
    }
  }
  Map<String,dynamic> _toGraphQL(CheckoutOrder order)=>{
    'id':order.id,
    'serviceIds':order.services,
    'scheduledAt':order.scheduled.toIso8601String(),
    'totalCents':order.total,
    'createdAt':order.created.toIso8601String(),
    'holdStatus':order.holdPlaced?'PLACED':'PENDING',
  };
}
