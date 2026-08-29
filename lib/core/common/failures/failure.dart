/// Base failure exposed across the application boundary.
///
/// Failures represent expected application-level error states.
/// They must not expose infrastructure-specific implementation
/// details to the presentation layer.
abstract class Failure {
  final String message;
  final String? code;
  final Object? cause;

  const Failure({required this.message, this.code, this.cause});

  @override
  String toString() => message;
}
