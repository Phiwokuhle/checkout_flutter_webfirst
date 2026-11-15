import 'dart:async';
import 'dart:convert';
import 'package:graphql/graphql.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/catalog.dart';

/// In-process GraphQL transport. Maps are restricted to the transport boundary.
/// Orders are persisted so web refresh does not create another financial outcome.
class LocalGraphqlLink extends Link {
  LocalGraphqlLink(this.prefs);
  final SharedPreferences prefs;
  static const _key = 'refreshi_orders_v1';
  static const holdDelay = Duration(seconds: 4);

  List<Map<String,dynamic>> _read() => ((jsonDecode(prefs.getString(_key) ?? '[]') as List)
      .map((e)=>Map<String,dynamic>.from(e as Map))).toList();
  Future<void> _save(List<Map<String,dynamic>> orders) async => prefs.setString(_key,jsonEncode(orders));

  Map<String,dynamic> _resolved(Map<String,dynamic> order) {
    final created=DateTime.parse(order['createdAt'] as String);
    if (DateTime.now().difference(created)>=holdDelay) {
      return {...order,'status':'HOLD_PLACED'};
    }
    return order;
  }

  @override
  Stream<Response> request(Request request, [NextLink? forward]) async* {
    try {
      final operation=request.operation.operationName;
      final orders=_read();
      if (operation=='CreateOrder') {
        final input=Map<String,dynamic>.from(request.variables['input'] as Map);
        final key=input['idempotencyKey'] as String;
        final existing=orders.where((o)=>o['idempotencyKey']==key);
        if (existing.isNotEmpty) {
          yield Response(data:{'createOrder':_resolved(existing.first)});
          return;
        }
        final ids=(input['serviceIds'] as List).cast<String>();
        if (ids.isEmpty || ids.length>2 || ids.toSet().length!=ids.length || ids.any((id)=>!catalog.any((s)=>s.id==id))) {
          throw StateError('Select one or two different services.');
        }
        final schedule=DateTime.parse(input['scheduledAt'] as String);
        if (!schedule.isAfter(DateTime.now())) throw StateError('Select a future schedule.');
        if (input['cardToken']!='tok_visa_4242') throw StateError('Invalid saved card token.');
        final selected=catalog.where((s)=>ids.contains(s.id)).toList();
        final order=<String,dynamic>{
          'id':'ord_${key.replaceAll('-', '').substring(0,12)}',
          'idempotencyKey':key,
          'services':selected.map((s)=>{'id':s.id,'name':s.name,'priceCents':s.priceCents,'durationMinutes':s.durationMinutes}).toList(),
          'scheduledAt':schedule.toIso8601String(),
          'totalCents':selected.fold<int>(0,(sum,s)=>sum+s.priceCents),
          'cardLast4':'4242','status':'PENDING','createdAt':DateTime.now().toIso8601String(),
        };
        orders.add(order);
        await _save(orders);
        yield Response(data:{'createOrder':order});
      } else if (operation=='GetOrder') {
        final id=request.variables['id'] as String;
        final matching=orders.where((o)=>o['id']==id);
        yield Response(data:{'order':matching.isEmpty?null:_resolved(matching.first)});
      } else {
        throw UnsupportedError('Unsupported GraphQL operation: $operation');
      }
    } catch (error) {
      yield Response(data:null,errors:[GraphQLError(message:error.toString())]);
    }
  }
}
