import 'failure.dart';

class ApiFailure extends Failure {
  const ApiFailure({required super.message, super.code, super.cause});
}
