import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../app/di.dart';
import '../domain/session_repository.dart';
import '../../../core/ui.dart';
class SignInPage extends StatefulWidget {
 const SignInPage({super.key,required this.returnTo});
 final String returnTo;
 @override State<SignInPage> createState()=>_SignInPageState();
}
class _SignInPageState extends State<SignInPage> {
 final email=TextEditingController(text:'demo@refreshi.co.za');
 final password=TextEditingController(text:'demo');
 bool busy=false;
 String? error;
 @override void dispose(){email.dispose();password.dispose();super.dispose();}
 Future<void> submit() async {
   setState((){busy=true;error=null;});
   try {await di<SessionRepository>().signIn(email.text,password.text);if(mounted) context.go(widget.returnTo.startsWith('/') && !widget.returnTo.startsWith('//')?widget.returnTo:'/');}
   catch(e){if(mounted)setState(()=>error='Enter a valid email and a password.');}
   finally {if(mounted)setState(()=>busy=false);}
 }
 @override Widget build(BuildContext context)=>PageFrame(child:Center(child:ConstrainedBox(constraints:const BoxConstraints(maxWidth:420),child:Card(child:Padding(padding:const EdgeInsets.all(28),child:Column(mainAxisSize:MainAxisSize.min,crossAxisAlignment:CrossAxisAlignment.stretch,children:[
   Text('Sign in',style:Theme.of(context).textTheme.headlineMedium),const SizedBox(height:8),const Text('Demo sign-in to view your order.'),const SizedBox(height:24),
   TextField(controller:email,keyboardType:TextInputType.emailAddress,decoration:const InputDecoration(labelText:'Email')),const SizedBox(height:14),
   TextField(controller:password,obscureText:true,decoration:const InputDecoration(labelText:'Password')),const SizedBox(height:16),
   if(error!=null) Padding(padding:const EdgeInsets.only(bottom:12),child:Text(error!,style:TextStyle(color:Theme.of(context).colorScheme.error))),
   FilledButton(onPressed:busy?null:submit,child:Text(busy?'Signing in…':'Sign in')),
 ]))))),
}
