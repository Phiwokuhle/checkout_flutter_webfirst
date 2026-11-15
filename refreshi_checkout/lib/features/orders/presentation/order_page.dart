import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../app/di.dart';
import '../../../core/generated/checkout_models.g.dart';
import '../../../core/ui.dart';
import '../domain/order_repository.dart';
class OrderPage extends StatefulWidget {
 const OrderPage({super.key,required this.id});
 final String id;
 @override State<OrderPage> createState()=>_OrderPageState();
}
class _OrderPageState extends State<OrderPage> {
 GqlOrder? order;
 String? error;
 bool loading=true;
 Timer? poll;
 @override void initState(){super.initState();load();poll=Timer.periodic(const Duration(seconds:1),(_){if(order?.status=='PENDING' && !loading)load(silent:true);});}
 Future<void> load({bool silent=false}) async {
   try {final result=await di<OrderRepository>().find(widget.id);if(mounted)setState((){order=result;error=null;loading=false;});}
   catch(_){if(mounted)setState((){error='Unable to load order.';loading=false;});}
 }
 @override void dispose(){poll?.cancel();super.dispose();}
 @override Widget build(BuildContext context)=>PageFrame(child:Align(alignment:Alignment.topCenter,child:ConstrainedBox(constraints:const BoxConstraints(maxWidth:750),child:loading?const Center(child:CircularProgressIndicator()):error!=null?Column(mainAxisSize:MainAxisSize.min,children:[Text(error!),const SizedBox(height:12),OutlinedButton(onPressed:()=>load(),child:const Text('Retry'))]):order==null?Column(mainAxisSize:MainAxisSize.min,children:[const Text('Order not found'),TextButton(onPressed:()=>context.go('/'),child:const Text('Back to services'))]):_details(context,order!))));
 Widget _details(BuildContext context,GqlOrder o) {
   final confirmed=o.status=='HOLD_PLACED';
   return Column(crossAxisAlignment:CrossAxisAlignment.stretch,children:[
     Text('Order details',style:Theme.of(context).textTheme.headlineLarge),const SizedBox(height:8),Text(o.id,style:Theme.of(context).textTheme.bodySmall),const SizedBox(height:20),
     Card(child:Padding(padding:const EdgeInsets.all(24),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
       Row(children:[Icon(confirmed?Icons.check_circle:Icons.hourglass_top,color:confirmed?Colors.teal:Colors.orange),const SizedBox(width:10),Expanded(child:Text(confirmed?'Payment hold confirmed':'Payment hold pending',style:Theme.of(context).textTheme.titleLarge))]),
       const SizedBox(height:12),Text(confirmed?'Your temporary payment hold is in place.':'Your order was created. Waiting for the temporary hold to be confirmed.'),
       if(!confirmed)const Padding(padding:EdgeInsets.only(top:14),child:LinearProgressIndicator()),
       const Divider(height:36),_step('Order created',true),const SizedBox(height:12),_step('Hold placed',confirmed),
       const Divider(height:36),Text('Scheduled for ${dateLabel(DateTime.parse(o.scheduledAt))}'),const SizedBox(height:14),
       ...o.services.map((s)=>Padding(padding:const EdgeInsets.symmetric(vertical:6),child:Row(children:[Expanded(child:Text(s.name)),Text(zar(s.priceCents))])) ,
       const Divider(height:24),Row(children:[const Expanded(child:Text('Total',style:TextStyle(fontWeight:FontWeight.bold))),Text(zar(o.totalCents),style:const TextStyle(fontWeight:FontWeight.bold))]),
       const SizedBox(height:12),Text('Saved Visa •••• ${o.cardLast4}'),
     ]))),const SizedBox(height:18),Align(alignment:Alignment.centerLeft,child:TextButton(onPressed:()=>context.go('/'),child:const Text('Back to services')))
   ]);
 }
 Widget _step(String title,bool complete)=>Row(children:[Icon(complete?Icons.check_circle:Icons.radio_button_unchecked,color:complete?Colors.teal:Colors.grey),const SizedBox(width:12),Text(title)]);
}
