import 'package:flutter/material.dart';

/// ===========================================================
/// App Typography
/// Toro Demen Liburan
/// ERP Travel Umrah
/// ===========================================================

class AppTypography {
  AppTypography._();

  /// Font Family
  static const String fontFamily = 'Inter';

  /// Font Weight
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;

  /// ===========================================================
  /// Material 3 TextTheme
  /// ===========================================================

  static const TextTheme textTheme = TextTheme(

    /// DISPLAY
    displayLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 57,
      fontWeight: bold,
      height: 1.12,
      letterSpacing: -0.25,
    ),

    displayMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 45,
      fontWeight: bold,
      height: 1.16,
    ),

    displaySmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 36,
      fontWeight: semiBold,
      height: 1.22,
    ),

    /// HEADLINE
    headlineLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 32,
      fontWeight: bold,
      height: 1.25,
    ),

    headlineMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 28,
      fontWeight: semiBold,
      height: 1.29,
    ),

    headlineSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 24,
      fontWeight: semiBold,
      height: 1.33,
    ),

    /// TITLE
    titleLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 22,
      fontWeight: semiBold,
      height: 1.27,
    ),

    titleMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: medium,
      height: 1.50,
      letterSpacing: 0.15,
    ),

    titleSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: medium,
      height: 1.43,
      letterSpacing: 0.1,
    ),

    /// BODY
    bodyLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: regular,
      height: 1.50,
      letterSpacing: 0.5,
    ),

    bodyMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: regular,
      height: 1.43,
      letterSpacing: 0.25,
    ),

    bodySmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      fontWeight: regular,
      height: 1.33,
      letterSpacing: 0.4,
    ),

    /// LABEL
    labelLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: medium,
      height: 1.43,
      letterSpacing: 0.1,
    ),

    labelMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      fontWeight: medium,
      height: 1.33,
      letterSpacing: 0.5,
    ),

    labelSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 11,
      fontWeight: medium,
      height: 1.45,
      letterSpacing: 0.5,
    ),
  );

  /// ===========================================================
  /// Shortcut
  /// ===========================================================

  static TextStyle get displayLarge =>
      textTheme.displayLarge!;

  static TextStyle get displayMedium =>
      textTheme.displayMedium!;

  static TextStyle get displaySmall =>
      textTheme.displaySmall!;

  static TextStyle get headlineLarge =>
      textTheme.headlineLarge!;

  static TextStyle get headlineMedium =>
      textTheme.headlineMedium!;

  static TextStyle get headlineSmall =>
      textTheme.headlineSmall!;

  static TextStyle get titleLarge =>
      textTheme.titleLarge!;

  static TextStyle get titleMedium =>
      textTheme.titleMedium!;

  static TextStyle get titleSmall =>
      textTheme.titleSmall!;

  static TextStyle get bodyLarge =>
      textTheme.bodyLarge!;

  static TextStyle get bodyMedium =>
      textTheme.bodyMedium!;

  static TextStyle get bodySmall =>
      textTheme.bodySmall!;

  static TextStyle get labelLarge =>
      textTheme.labelLarge!;

  static TextStyle get labelMedium =>
      textTheme.labelMedium!;

  static TextStyle get labelSmall =>
      textTheme.labelSmall!;
}