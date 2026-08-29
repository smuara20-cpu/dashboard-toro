import 'app_exception.dart';

class AuthException extends AppException {
  const AuthException({required super.message, super.cause, super.stackTrace});
}
