import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:refreshi_checkout/presentation/auth/pages/signin_page.dart';
import 'package:refreshi_checkout/presentation/checkout/pages/checkout_page.dart';
import 'package:refreshi_checkout/presentation/orders/pages/order_details_page.dart';

import 'auth_session.dart';
import 'route_names.dart';

class AppRouter {
  AppRouter(this.session);

  final AuthSession session;

  late final GoRouter router = GoRouter(
    initialLocation: RoutePaths.signIn,
    refreshListenable: session,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(path: '/', redirect: (_, _) => RoutePaths.checkout),
      GoRoute(
        name: RouteNames.signIn,
        path: RoutePaths.signIn,
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        name: RouteNames.checkout,
        path: RoutePaths.checkout,
        builder: (context, state) => const CheckoutPage(),
      ),
      GoRoute(
        name: RouteNames.orderDetails,
        path: RoutePaths.orderDetails,
        builder: (context, state) =>
            OrderDetailsPage(orderId: state.pathParameters['orderId']!),
      ),
      GoRoute(
        name: RouteNames.error,
        path: RoutePaths.error,
        builder: (context, state) =>
            const Scaffold(body: Center(child: Text('Something went wrong.'))),
      ),
    ],
    redirect: (context, state) {
      final location = state.uri.path;
      final authenticated = session.isAuthenticated;
      final signingIn = location == RoutePaths.signIn;

      final protectedRoute = location.startsWith('/orders/');

      if (!authenticated && protectedRoute) {
        final returnTo = Uri.encodeComponent(state.uri.toString());

        return '${RoutePaths.signIn}?from=$returnTo';
      }

      if (authenticated && signingIn) {
        final from = state.uri.queryParameters['from'];

        if (from != null && from.startsWith('/') && !from.startsWith('//')) {
          return from;
        }

        return RoutePaths.checkout;
      }

      return null;
    },
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 48),
            const SizedBox(height: 16),
            const Text('Page not found'),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => context.go(RoutePaths.checkout),
              child: const Text('Back to checkout'),
            ),
          ],
        ),
      ),
    ),
  );
}
