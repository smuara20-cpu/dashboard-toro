import 'app_exception.dart';

class CacheException extends AppException {
  const CacheException({required super.message, super.cause, super.stackTrace});
}
