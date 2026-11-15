import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:refreshi_checkout/domain/checkout/data/order_store.dart';
void main(){
 TestWidgetsFlutterBinding.ensureInitialized();
 test('Order is recoverable from local storage after creating a new store',()async{
 SharedPreferences.setMockInitialValues({});
 final prefs=await SharedPreferences.getInstance();
 final first=OrderStore(prefs);
 final when=DateTime.now().add(const Duration(days:2));
 await first.create('RF-1',['office-refresh'],when,4800);
 final restored=await OrderStore(prefs).find('RF-1');
 expect(restored?.id,'RF-1');
 expect(restored?.total,4800);
 });
}
