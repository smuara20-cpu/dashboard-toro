import 'package:flutter/material.dart';

import '../design_tokens/color_tokens.dart';
import '../design_tokens/radius_tokens.dart';
import '../design_tokens/typography_tokens.dart';

abstract final class VentraTheme {
  static TextTheme textTheme() => const TextTheme(
        displayLarge: VentraTypography.display,
        headlineLarge: VentraTypography.h1,
        headlineMedium: VentraTypography.h2,
        headlineSmall: VentraTypography.h3,
        titleLarge: VentraTypography.h4,
        titleMedium: VentraTypography.h5,
        titleSmall: VentraTypography.h6,
        bodyLarge: VentraTypography.bodyLarge,
        bodyMedium: VentraTypography.body,
        bodySmall: VentraTypography.bodySmall,
        labelLarge: VentraTypography.label,
        labelMedium: VentraTypography.label,
        labelSmall: VentraTypography.caption,
      );

  static InputDecorationTheme inputDecorationTheme({required bool dark}) {
    final borderColor = dark ? const Color(0xFF344250) : VentraColors.border;
    final fillColor = dark ? const Color(0xFF17212B) : VentraColors.surface;
    final focusColor = dark ? const Color(0xFF5B9BD5) : VentraColors.brandPrimary;
    return InputDecorationTheme(
      filled: true,
      fillColor: fillColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(VentraRadius.md), borderSide: BorderSide(color: borderColor)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(VentraRadius.md), borderSide: BorderSide(color: borderColor)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(VentraRadius.md), borderSide: BorderSide(color: focusColor, width: 1.5)),
    );
  }
}