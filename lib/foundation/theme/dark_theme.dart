import 'package:flutter/material.dart';

import '../design_tokens/radius_tokens.dart';
import 'app_theme.dart';
import 'theme_extensions.dart';

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF0F1720),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF5B9BD5),
    onPrimary: Color(0xFF07131F),
    secondary: Color(0xFFD6B84A),
    onSecondary: Color(0xFF1A1608),
    surface: Color(0xFF17212B),
    onSurface: Color(0xFFF4F7FA),
    error: Color(0xFFFF6B6B),
    onError: Color(0xFF2B0909),
  ),
  textTheme: VentraTheme.textTheme().apply(bodyColor: const Color(0xFFF4F7FA), displayColor: const Color(0xFFF4F7FA)),
  inputDecorationTheme: VentraTheme.inputDecorationTheme(dark: true),
  cardTheme: CardThemeData(
    elevation: 0,
    margin: EdgeInsets.zero,
    color: const Color(0xFF17212B),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(VentraRadius.lg), side: const BorderSide(color: Color(0xFF344250))),
  ),
  dividerTheme: const DividerThemeData(color: Color(0xFF344250), thickness: 1, space: 1),
  extensions: const <ThemeExtension<dynamic>>[VentraSemanticColors.light],
);