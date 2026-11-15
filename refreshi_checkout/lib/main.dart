import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app/di.dart';
import 'app/router.dart';
import 'app/theme.dart';
import 'features/auth/domain/session_repository.dart';
Future<void> main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await configureDependencies();
 runApp(RefreshiApp(router:AppRouter(di<SessionRepository>()).router));
}
class RefreshiApp extends StatelessWidget {
 const RefreshiApp({super.key,required this.router});
 final GoRouter router;
 @override Widget build(BuildContext context)=>MaterialApp.router(title:'Refreshi Checkout',debugShowCheckedModeBanner:false,theme:appTheme(),routerConfig:router);
}
