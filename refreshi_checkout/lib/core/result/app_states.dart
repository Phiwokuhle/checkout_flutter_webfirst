import 'package:refreshi_checkout/core/errors/app_failures.dart';

sealed class AppResult<T> {
  const AppResult();
}

final class Success<T> extends AppResult<T> {
  const Success(this.data);

  final T data;
}

final class Failure<T> extends AppResult<T> {
  const Failure(this.error);

  final AppFailure error;
}
