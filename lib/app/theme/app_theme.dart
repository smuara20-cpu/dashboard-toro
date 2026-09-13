import 'package:flutter/material.dart';

import '../../foundation/theme/ventra_theme_data.dart';

/// Application-level theme facade.
///
/// The application consumes the VENTRA foundation through this boundary so
/// feature code does not depend directly on individual design tokens.
abstract final class AppTheme {
  static ThemeData get light => VentraThemeData.light;
  static ThemeData get dark => VentraThemeData.dark;
}