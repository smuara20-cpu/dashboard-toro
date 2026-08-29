/// Base exception for infrastructure and data-layer errors.
///
/// Exceptions represent technical failures that occur below
/// the application/domain boundary.
abstract class AppException implements Exception {
  final String message;
  final Object? cause;
  final StackTrace? stackTrace;

  const AppException({required this.message, this.cause, this.stackTrace});

  @override
  String toString() => message;
}
