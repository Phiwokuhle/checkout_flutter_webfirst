import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:refreshi_checkout/presentation/auth/pages/signin_page.dart';
import 'package:refreshi_checkout/presentation/checkout/pages/checkout_page.dart';
import 'package:refreshi_checkout/presentation/orders/pages/order_details_page.dart';
import 'auth_session.dart';
import 'route_names.dart';
class AppRouter{
 AppRouter(this.session);
 final AuthSession session;
 late final GoRouter router=GoRouter(
 initialLocation:RoutePaths.checkout,refreshListenable:session,
 routes:[
 GoRoute(path:'/',redirect:(_,__)=>RoutePaths.checkout),
 GoRoute(name:RouteNames.signIn,path:RoutePaths.signIn,builder:(_,__)=>const SignInPage()),
 GoRoute(name:RouteNames.checkout,path:RoutePaths.checkout,builder:(_,__)=>const CheckoutPage()),
 GoRoute(name:RouteNames.orderDetails,path:RoutePaths.orderDetails,builder:(_,s)=>OrderDetailsPage(orderId:s.pathParameters['orderId']!)),
 GoRoute(name:RouteNames.error,path:RoutePaths.error,builder:(_,__)=>const Scaffold(body:Center(child:Text('Something went wrong.'))))
 ],
 redirect:(_,state){
 final signingIn=state.uri.path==RoutePaths.signIn;
 if(!session.isAuthenticated&&!signingIn)return RoutePaths.signIn+'?from='+Uri.encodeComponent(state.uri.toString());
 if(session.isAuthenticated&&signingIn){
 final from=state.uri.queryParameters['from'];
 if(from!=null&&from.startsWith('/')&&!from.startsWith('//'))return from;
 return RoutePaths.checkout;
 }
 return null;
 },
 errorBuilder:(context,_)=>Scaffold(body:Center(child:TextButton(onPressed:()=>context.go(RoutePaths.checkout),child:const Text('Page not found • Back to checkout'))))
 );
}