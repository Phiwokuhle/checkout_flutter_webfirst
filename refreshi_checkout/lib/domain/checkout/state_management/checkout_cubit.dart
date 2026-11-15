import 'package:flutter/foundation.dart';
import '../repositories/order_repository.dart';
import '../data/order_store.dart';
import '../data/service_model.dart';

class CheckoutController extends ChangeNotifier {
  CheckoutController(this.repository);
  final OrderRepository repository;
  final selected=<String>{};
  DateTime? date;
  int? hour,minute;
  String? error;
  bool submitting=false;
  String? _requestId;
  int get totalCents=>_prices.entries.where((e)=>selected.contains(e.key)).fold(0,(a,e)=>a+e.value);
  Map<String,int> _prices=const {};
  void setCatalog(List<ServiceModel> services) {
    _prices={for(final service in services) service.id:service.priceCents};
    selected.removeWhere((id)=>!_prices.containsKey(id));
    _requestId=null;
    notifyListeners();
  }
  DateTime? get scheduledAt=>date==null||hour==null||minute==null?null:DateTime(date!.year,date!.month,date!.day,hour!,minute!);
  void toggle(String id){
    if(submitting)return;
    error=null;
    if(!selected.remove(id)){
      if(selected.length>=2){error='You can select up to two services.';}
      else if(_prices.containsKey(id)){selected.add(id);}
    }
    _requestId=null;notifyListeners();
  }
  void setDate(DateTime value){date=value;_requestId=null;error=null;notifyListeners();}
  void setTime(int h,int m){hour=h;minute=m;_requestId=null;error=null;notifyListeners();}
  Future<CheckoutOrder?> submit()async{
    if(submitting)return null;
    final scheduled=scheduledAt;
    if(selected.isEmpty||scheduled==null||!scheduled.isAfter(DateTime.now())){error='Select services and a future date and time.';notifyListeners();return null;}
    submitting=true;error=null;notifyListeners();
    try{
      _requestId??='RF-${DateTime.now().microsecondsSinceEpoch}';
      return await repository.create(requestId:_requestId!,serviceIds:selected.toList()..sort(),scheduledAt:scheduled,totalCents:totalCents);
    }catch(e){
      final detail=e.toString().toLowerCase();
      if(detail.contains('declined')){
        error='Your saved card could not be authorised. Please try again.';
      }else if(detail.contains('timed out')||detail.contains('timeout')){
        error='The payment service took too long to respond. Please retry.';
      }else{
        error='We could not place your order. Please retry.';
      }
      return null;
    }
    finally{submitting=false;notifyListeners();}
  }
}
