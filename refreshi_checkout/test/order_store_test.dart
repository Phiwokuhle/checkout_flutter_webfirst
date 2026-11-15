import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:refreshi_checkout/domain/checkout/data/order_store.dart';
void main(){
 TestWidgetsFlutterBinding.ensureInitialized();
 test('repeated request ID creates only one order',()async{
 SharedPreferences.setMockInitialValues({});
 final store=OrderStore(await SharedPreferences.getInstance());
 final date=DateTime.now().add(const Duration(days:1));
 final first=await store.create('request-1',['a'],date,4800);
 final second=await store.create('request-1',['a'],date,4800);
 expect(first.id,second.id);
 expect((await store.all()).length,1);
 });
}