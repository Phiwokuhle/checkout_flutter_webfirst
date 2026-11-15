import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/auth/domain/session_repository.dart';
import '../features/auth/presentation/sign_in_page.dart';
import '../features/checkout/presentation/checkout_page.dart';
import '../features/orders/presentation/order_page.dart';
class AppRouter {
  AppRouter(this.session);
  final SessionRepository session;
  late final GoRouter router=GoRouter(
    routes:[
      GoRoute(path:'/',builder:(context,state)=>const CheckoutPage()),
      GoRoute(path:'/sign-in',builder:(context,state)=>SignInPage(returnTo:state.uri.queryParameters['from']??'/')),
      GoRoute(path:'/orders/:id',builder:(context,state)=>OrderPage(id:state.pathParameters['id']!)),
    ],
    redirect:(context,state){
      if(state.uri.path.startsWith('/orders/') && !session.signedIn) {
        return '/sign-in?from=${Uri.encodeComponent(state.uri.toString())}';
      }
      return null;
    },
    errorBuilder:(context,state)=>Scaffold(body:Center(child:Column(mainAxisSize:MainAxisSize.min,children:[const Text('Page not found'),TextButton(onPressed:()=>context.go('/'),child:const Text('Back to services'))]))),
  );
}
