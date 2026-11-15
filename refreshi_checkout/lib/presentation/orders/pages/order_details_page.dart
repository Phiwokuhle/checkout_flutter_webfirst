import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:refreshi_checkout/core/config/route_names.dart';
import 'package:refreshi_checkout/core/di/injection.dart';
import 'package:refreshi_checkout/domain/checkout/data/order_store.dart';
import 'package:refreshi_checkout/presentation/common/widgets/app_shell.dart';
import 'package:refreshi_checkout/presentation/common/widgets/app_shimmer.dart';
class OrderDetailsPage extends StatefulWidget{
 const OrderDetailsPage({super.key,required this.orderId});
 final String orderId;
 @override State<OrderDetailsPage> createState()=>_OrderDetailsPageState();
}
class _OrderDetailsPageState extends State<OrderDetailsPage>{
 CheckoutOrder? order;bool loading=true;String? error;Timer? timer;
 @override void initState(){super.initState();refresh();}
 Future<void> refresh()async{
 try{
 final result=await getIt<OrderStore>().find(widget.orderId);
 if(!mounted)return;
 setState((){order=result;loading=false;error=result==null?'Order not found.':null;});
 timer?.cancel();
 if(result!=null&&!result.holdPlaced)timer=Timer(const Duration(seconds:4),refresh);
 }catch(_){if(mounted)setState((){loading=false;error='Unable to load order. Retry.';});}
 }
 @override void dispose(){timer?.cancel();super.dispose();}
 @override Widget build(BuildContext context)=>AssessmentShell(activeStep:2,child:ConstrainedBox(
 constraints:const BoxConstraints(maxWidth:760),
 child:Column(crossAxisAlignment:CrossAxisAlignment.stretch,children:[
 Text('Order Details',style:Theme.of(context).textTheme.headlineMedium),
 const SizedBox(height:24),
 if(loading)...[const AppShimmer(height:120),const SizedBox(height:16),const AppShimmer(height:160)]
 else if(error!=null)...[
 Text(error!,style:TextStyle(color:Theme.of(context).colorScheme.error)),
 OutlinedButton(onPressed:(){setState(()=>loading=true);refresh();},child:const Text('Retry'))
 ]else if(order!=null)...[
 Card(child:Padding(padding:const EdgeInsets.all(20),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
 Text('Order '+order!.id,style:Theme.of(context).textTheme.titleLarge),
 const SizedBox(height:12),
 Text('Scheduled: '+order!.scheduled.toLocal().toString()),
 Text('Services: '+order!.services.join(', ')),
 Text('Total: '+String.fromCharCode(36)+(order!.total/100).toStringAsFixed(2)),
 ]))),
 const SizedBox(height:20),
 Text('Timeline',style:Theme.of(context).textTheme.titleLarge),
 const ListTile(leading:Icon(Icons.check_circle,color:Colors.teal),title:Text('Created')),
 ListTile(leading:Icon(order!.holdPlaced?Icons.check_circle:Icons.hourglass_top,color:order!.holdPlaced?Colors.teal:Colors.orange),title:Text(order!.holdPlaced?'Hold Placed':'Hold Pending')),
 const SizedBox(height:12),
 SelectableText('Order link: '+Uri.base.origin+RoutePaths.order(order!.id))
 ],
 const SizedBox(height:20),
 OutlinedButton(onPressed:()=>context.go(RoutePaths.checkout),child:const Text('Back to checkout'))
 ])));
}