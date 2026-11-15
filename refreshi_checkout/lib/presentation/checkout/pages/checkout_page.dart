import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:refreshi_checkout/core/config/route_names.dart';
import 'package:refreshi_checkout/core/di/injection.dart';
import 'package:refreshi_checkout/data/checkout/graphql_service_catalog.dart';
import 'package:refreshi_checkout/domain/checkout/data/service_model.dart';
import 'package:refreshi_checkout/domain/checkout/repositories/order_repository.dart';
import 'package:refreshi_checkout/domain/checkout/state_management/checkout_cubit.dart';
import 'package:refreshi_checkout/presentation/common/widgets/app_shell.dart';
import 'package:refreshi_checkout/presentation/common/widgets/app_shimmer.dart';

class CheckoutPage extends StatefulWidget {
 const CheckoutPage({super.key});
 @override State<CheckoutPage> createState()=>_CheckoutPageState();
}
class _CheckoutPageState extends State<CheckoutPage> {
 late final CheckoutController controller;
 bool loading=true;
 List<ServiceModel> services=const [];
 String? catalogError;
 Future<void> loadCatalog() async {
   setState(() { loading=true; catalogError=null; });
   try {
     final items=await getIt<GraphqlServiceCatalog>().load();
     if(mounted){controller.setCatalog(items);setState(() => services=items);}
   } catch (_) {
     if(mounted)setState(() => catalogError='Unable to load services. Please retry.');
   } finally {
     if(mounted)setState(() => loading=false);
   }
 }
 @override void initState(){
 super.initState();
 controller=CheckoutController(getIt<OrderRepository>());
 loadCatalog();
 }
 @override void dispose(){controller.dispose();super.dispose();}
 String money(int cents)=>'R '+(cents/100).toStringAsFixed(2);
 Future<void> confirm()async{
 final order=await controller.submit();
 if(mounted&&order!=null)context.go(RoutePaths.order(order.id));
 }
 @override Widget build(BuildContext context)=>AssessmentShell(activeStep:1,child:ConstrainedBox(
 constraints:const BoxConstraints(maxWidth:780),
 child:AnimatedBuilder(animation:controller,builder:(context,_)=>Column(
 crossAxisAlignment:CrossAxisAlignment.stretch,children:[
 Text('Catalog & Checkout',style:Theme.of(context).textTheme.headlineMedium),
 const SizedBox(height:8),const Text('Choose one or two services and a convenient time.'),
 const SizedBox(height:24),
 if(loading)...[for(var i=0;i<3;i++)...[const AppShimmer(height:110),const SizedBox(height:12)]]
 else if(catalogError!=null)...[
 Text(catalogError!,style:TextStyle(color:Theme.of(context).colorScheme.error)),
 OutlinedButton(onPressed:loadCatalog,child:const Text('Retry')),
 ] else if(services.isEmpty)...[
 const Text('No services are available right now.'),
 OutlinedButton(onPressed:loadCatalog,child:const Text('Refresh')),
 ] else...[
 for(final service in services)...[
 Card(child:CheckboxListTile(
 value:controller.selected.contains(service.id),
 onChanged:controller.submitting?null:(_)=>controller.toggle(service.id),
 title:Text(service.name),
 subtitle:Text(service.description+' • '+service.durationMinutes.toString()+' min • '+money(service.priceCents)),
 controlAffinity:ListTileControlAffinity.leading,
 )),
 const SizedBox(height:8)],
 const SizedBox(height:20),
 Text('Schedule',style:Theme.of(context).textTheme.titleLarge),
 const SizedBox(height:12),
 Wrap(spacing:12,runSpacing:12,children:[
 OutlinedButton.icon(icon:const Icon(Icons.calendar_today),label:Text(controller.date==null?'Choose date':'Date: '+controller.date!.day.toString()+'/'+controller.date!.month.toString()+'/'+controller.date!.year.toString()),onPressed:controller.submitting?null:()async{
 final date=await showDatePicker(context:context,initialDate:controller.date??DateTime.now().add(const Duration(days:1)),firstDate:DateTime.now(),lastDate:DateTime.now().add(const Duration(days:365)));
 if(date!=null)controller.setDate(date);
 }),
 OutlinedButton.icon(icon:const Icon(Icons.schedule),label:Text(controller.hour==null?'Choose time':TimeOfDay(hour:controller.hour!,minute:controller.minute!).format(context)),onPressed:controller.submitting?null:()async{
 final time=await showTimePicker(context:context,initialTime:const TimeOfDay(hour:9,minute:0));
 if(time!=null)controller.setTime(time.hour,time.minute);
 })
 ]),
 const SizedBox(height:24),
 const Card(child:ListTile(leading:Icon(Icons.credit_card),title:Text('Visa ending in 4242'),subtitle:Text('Saved card token • simulated payment hold'))),
 const SizedBox(height:16),
 Text('Total: '+money(controller.totalCents),style:Theme.of(context).textTheme.titleLarge),
 if(controller.error!=null)...[const SizedBox(height:12),Text(controller.error!,style:TextStyle(color:Theme.of(context).colorScheme.error))],
 const SizedBox(height:18),
 FilledButton(onPressed:controller.submitting?null:confirm,child:Text(controller.submitting?'Placing order…':'Confirm & place hold')),
 ]
 ]))));
}
