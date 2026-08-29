import 'app_exception.dart';

class ApiException extends AppException {
  const ApiException({required super.message, super.cause, super.stackTrace});
}
