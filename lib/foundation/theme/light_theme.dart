import 'package:flutter/material.dart';

import '../design_tokens/color_tokens.dart';
import '../design_tokens/radius_tokens.dart';
import 'app_theme.dart';
import 'theme_extensions.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: VentraColors.background,
  colorScheme: const ColorScheme.light(
    primary: VentraColors.brandPrimary,
    onPrimary: VentraColors.textOnBrand,
    secondary: VentraColors.brandSecondary,
    onSecondary: VentraColors.textOnBrand,
    surface: VentraColors.surface,
    onSurface: VentraColors.textPrimary,
    error: VentraColors.error,
    onError: VentraColors.textOnBrand,
  ),
  textTheme: VentraTheme.textTheme(),
  inputDecorationTheme: VentraTheme.inputDecorationTheme(dark: false),
  cardTheme: CardThemeData(
    elevation: 0,
    margin: EdgeInsets.zero,
    color: VentraColors.surface,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(VentraRadius.lg), side: const BorderSide(color: VentraColors.border)),
  ),
  dividerTheme: const DividerThemeData(color: VentraColors.border, thickness: 1, space: 1),
  extensions: const <ThemeExtension<dynamic>>[VentraSemanticColors.light],
);