import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:refreshi_checkout/core/config/route_names.dart';
import 'package:refreshi_checkout/core/di/injection.dart';
import 'package:refreshi_checkout/domain/checkout/data/mock_service_catalog.dart';
import 'package:refreshi_checkout/domain/checkout/data/order_store.dart';
import 'package:refreshi_checkout/presentation/common/widgets/app_shell.dart';
import 'package:refreshi_checkout/presentation/common/widgets/app_shimmer.dart';
class CheckoutPage extends StatefulWidget{
 const CheckoutPage({super.key});
 @override State<CheckoutPage> createState()=>_CheckoutPageState();
}
class _CheckoutPageState extends State<CheckoutPage>{
 final selected=<String>{};
 DateTime? date;TimeOfDay? time;
 bool loading=true,submitting=false;
 String? error,requestId;
 @override void initState(){super.initState();Future<void>.delayed(const Duration(milliseconds:600),(){if(mounted)setState(()=>loading=false);});}
 int get total=>MockServiceCatalog.services.where((s)=>selected.contains(s.id)).fold<int>(0,(a,s)=>a+s.priceCents);
 DateTime? get scheduled=>date==null||time==null?null:DateTime(date!.year,date!.month,date!.day,time!.hour,time!.minute);
 String money(int cents)=>String.fromCharCode(36)+(cents/100).toStringAsFixed(2);
 void toggle(String id){if(submitting)return;setState((){error=null;requestId=null;if(!selected.remove(id)){if(selected.length==2){error='Maximum two services.';}else{selected.add(id);}}});}
 Future<void> submit()async{
  if(submitting)return;
  final when=scheduled;
  if(selected.isEmpty||when==null||!when.isAfter(DateTime.now())){setState(()=>error='Select services and a future date and time.');return;}
  setState((){submitting=true;error=null;});
  try{
   requestId??='RF-'+DateTime.now().microsecondsSinceEpoch.toString();
   final order=await getIt<OrderStore>().create(requestId!,selected.toList()..sort(),when,total);
   if(mounted)context.go(RoutePaths.order(order.id));
  }catch(_){if(mounted)setState(()=>error='Unable to place order. Retry safely.');}
  finally{if(mounted)setState(()=>submitting=false);}
 }
 @override Widget build(BuildContext context)=>AssessmentShell(activeStep:1,child:ConstrainedBox(
 constraints:const BoxConstraints(maxWidth:780),
 child:Column(crossAxisAlignment:CrossAxisAlignment.stretch,children:[
 Text('Catalog & Checkout',style:Theme.of(context).textTheme.headlineMedium),
 const SizedBox(height:8),const Text('Select one or two services, then schedule your visit.'),
 const SizedBox(height:24),
 if(loading)...[for(var i=0;i<3;i++)...[const AppShimmer(height:110),const SizedBox(height:12)]]
 else...[
 for(final service in MockServiceCatalog.services)...[
 Card(child:CheckboxListTile(value:selected.contains(service.id),onChanged:submitting?null:(_)=>toggle(service.id),title:Text(service.name),subtitle:Text(service.description+' • '+service.durationMinutes.toString()+' min • '+money(service.priceCents)),controlAffinity:ListTileControlAffinity.leading)),
 const SizedBox(height:8)],
 const SizedBox(height:20),
 Text('Schedule',style:Theme.of(context).textTheme.titleLarge),
 const SizedBox(height:12),
 Wrap(spacing:12,runSpacing:12,children:[
 OutlinedButton.icon(icon:const Icon(Icons.calendar_today),label:Text(date==null?'Choose date':'Date: '+date!.day.toString()+'/'+date!.month.toString()+'/'+date!.year.toString()),onPressed:submitting?null:()async{
 final picked=await showDatePicker(context:context,initialDate:date??DateTime.now().add(const Duration(days:1)),firstDate:DateTime.now(),lastDate:DateTime.now().add(const Duration(days:365)));
 if(picked!=null)setState((){date=picked;requestId=null;});}),
 OutlinedButton.icon(icon:const Icon(Icons.schedule),label:Text(time==null?'Choose time':time!.format(context)),onPressed:submitting?null:()async{
 final picked=await showTimePicker(context:context,initialTime:time??const TimeOfDay(hour:9,minute:0));
 if(picked!=null)setState((){time=picked;requestId=null;});})
 ]),
 const SizedBox(height:24),
 const Card(child:ListTile(leading:Icon(Icons.credit_card),title:Text('Visa ending in 4242'),subtitle:Text('Saved card token • simulated hold'))),
 const SizedBox(height:16),
 Text('Total: '+money(total),style:Theme.of(context).textTheme.titleLarge),
 if(error!=null)...[const SizedBox(height:12),Text(error!,style:TextStyle(color:Theme.of(context).colorScheme.error))],
 const SizedBox(height:18),
 FilledButton(onPressed:submitting?null:submit,child:Text(submitting?'Placing order…':'Confirm & place hold'))
 ]]))); 
}