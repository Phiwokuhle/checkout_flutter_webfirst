import 'dart:async';
import 'package:flutter/foundation.dart';
import '../../checkout/data/order_store.dart';
import '../../checkout/repositories/order_repository.dart';
class OrderController extends ChangeNotifier {
  OrderController(this.repository);
  final OrderRepository repository;
  CheckoutOrder? order;
  bool loading=false;
  String? error;
  Timer? _timer;
  Future<void> load(String id)async{
    loading=order==null;error=null;notifyListeners();
    try{
      order=await repository.find(id);
      if(order==null)error='Order not found.';
      _timer?.cancel();
      if(order!=null&&!order!.holdPlaced)_timer=Timer(const Duration(seconds:4),()=>load(id));
    }catch(_){error='Unable to load order. Please retry.';}
    finally{loading=false;notifyListeners();}
  }
  @override void dispose(){_timer?.cancel();super.dispose();}
}
