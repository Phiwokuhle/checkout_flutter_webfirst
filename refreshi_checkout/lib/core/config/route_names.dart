abstract final class RouteNames {
  static const signIn = 'signIn';
  static const checkout = 'checkout';
  static const orderDetails = 'orderDetails';
  static const error = 'error';
}

abstract final class RoutePaths {
  static const signIn = '/sign-in';
  static const checkout = '/checkout';
  static const orderDetails = '/orders/:orderId';
  static const error = '/error';

  static String order(String orderId) =>
      '/orders/${Uri.encodeComponent(orderId)}';
}
