import 'app_exception.dart';

class ValidationException extends AppException {
  const ValidationException({
    required super.message,
    super.cause,
    super.stackTrace,
  });
}
