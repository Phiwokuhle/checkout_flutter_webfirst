import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CheckoutOrder {
  const CheckoutOrder(this.id, this.services, this.scheduled, this.total, this.created);
  final String id;
  final List<String> services;
  final DateTime scheduled;
  final int total;
  final DateTime created;
  bool get holdPlaced => DateTime.now().difference(created).inSeconds >= 4;
  Map<String,dynamic> toJson() => {'id':id,'services':services,'scheduled':scheduled.toIso8601String(),'total':total,'created':created.toIso8601String()};
  factory CheckoutOrder.fromJson(Map<String,dynamic> j) => CheckoutOrder(j['id'] as String,List<String>.from(j['services'] as List),DateTime.parse(j['scheduled'] as String),j['total'] as int,DateTime.parse(j['created'] as String));
}
class OrderStore {
  OrderStore(this.prefs);
  final SharedPreferences prefs;
  static const key = 'refreshi_orders_v2';
  Future<List<CheckoutOrder>> all() async {
    await Future<void>.delayed(const Duration(milliseconds: 350));
    final raw=prefs.getString(key);
    if(raw==null)return [];
    return (jsonDecode(raw) as List).map((e)=>CheckoutOrder.fromJson(Map<String,dynamic>.from(e as Map))).toList();
  }
  Future<CheckoutOrder?> find(String id) async {
    final orders=await all();
    for(final order in orders){if(order.id==id)return order;}
    return null;
  }
  Future<CheckoutOrder> create(String id,List<String> services,DateTime scheduled,int total) async {
    final orders=await all();
    for(final order in orders){if(order.id==id)return order;}
    await Future<void>.delayed(const Duration(milliseconds: 650));
    final order=CheckoutOrder(id,List.unmodifiable(services),scheduled,total,DateTime.now());
    orders.add(order);
    if(!await prefs.setString(key,jsonEncode(orders.map((e)=>e.toJson()).toList())))throw StateError('Unable to persist order');
    return order;
  }
}
