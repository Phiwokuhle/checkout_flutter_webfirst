enum FailureType {
  validation,
  unauthorized,
  notFound,
  timeout,
  network,
  paymentDeclined,
  server,
  unknown,
}

class AppFailure {
  const AppFailure({
    required this.type,
    required this.message,
    this.code,
    this.retryable = false,
  });

  final FailureType type;
  final String message;
  final String? code;
  final bool retryable;
}
