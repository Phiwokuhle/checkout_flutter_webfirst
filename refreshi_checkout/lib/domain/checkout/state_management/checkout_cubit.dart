import 'package:flutter/foundation.dart';
import '../repositories/order_repository.dart';
import '../data/order_store.dart';

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
  static const _prices={'office-refresh':4800,'hepa-decontamination':8500,'duct-treatment':12000};
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
    }catch(e){error='Unable to place order: '+e.toString();return null;}
    finally{submitting=false;notifyListeners();}
  }
}
