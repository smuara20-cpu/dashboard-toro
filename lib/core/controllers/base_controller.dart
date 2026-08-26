/// Base controller contract for feature-level application controllers.
///
/// This abstraction defines the minimum lifecycle contract that every
/// application controller must implement.
///
/// Controllers extending this class must provide:
/// - initialization logic
/// - refresh logic
///
/// Business logic should remain outside this base abstraction.
abstract class BaseController {
  /// Initializes the controller and prepares the required state.
  Future<void> initialize();

  /// Refreshes the controller state and related data.
  Future<void> refresh();
}