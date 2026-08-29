import '../exceptions/api_exception.dart';
import '../exceptions/auth_exception.dart';
import '../exceptions/cache_exception.dart';
import '../exceptions/validation_exception.dart';
import '../failures/api_failure.dart';
import '../failures/auth_failure.dart';
import '../failures/failure.dart';
import '../failures/validation_failure.dart';

Failure exceptionToFailure(Object error) {
  if (error is ValidationException) {
    return ValidationFailure(message: error.message, cause: error.cause);
  }

  if (error is AuthException) {
    return AuthFailure(message: error.message, cause: error.cause);
  }

  if (error is ApiException) {
    return ApiFailure(message: error.message, cause: error.cause);
  }

  if (error is CacheException) {
    return ApiFailure(
      message: error.message,
      code: 'CACHE_ERROR',
      cause: error.cause,
    );
  }

  return ApiFailure(
    message: error.toString(),
    code: 'UNKNOWN_ERROR',
    cause: error,
  );
}
