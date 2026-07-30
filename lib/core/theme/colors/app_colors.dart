import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ==========================================================
  // PRIMARY COLOR
  // ==========================================================

  static const Color primary = Color(0xFF0A3D91);
  static const Color primaryLight = Color(0xFF2D6BD9);
  static const Color primaryDark = Color(0xFF062A60);

  // ==========================================================
  // SECONDARY
  // ==========================================================

  static const Color secondary = Color(0xFFD4AF37);
  static const Color secondaryLight = Color(0xFFF3D97A);
  static const Color secondaryDark = Color(0xFF9F7B12);

  // ==========================================================
  // BACKGROUND
  // ==========================================================

  static const Color background = Color(0xFFF8FAFC);

  static const Color surface = Colors.white;

  static const Color card = Colors.white;

  // ==========================================================
  // TEXT
  // ==========================================================

  static const Color textPrimary = Color(0xFF111827);

  static const Color textSecondary = Color(0xFF6B7280);

  static const Color textHint = Color(0xFF9CA3AF);

  static const Color textWhite = Colors.white;

  // ==========================================================
  // BORDER
  // ==========================================================

  static const Color border = Color(0xFFE5E7EB);

  static const Color divider = Color(0xFFF1F5F9);

  // ==========================================================
  // STATUS
  // ==========================================================

  static const Color success = Color(0xFF16A34A);

  static const Color warning = Color(0xFFF59E0B);

  static const Color danger = Color(0xFFDC2626);

  static const Color info = Color(0xFF2563EB);

  // ==========================================================
  // GREY
  // ==========================================================

  static const Color gray50 = Color(0xFFF9FAFB);

  static const Color gray100 = Color(0xFFF3F4F6);

  static const Color gray200 = Color(0xFFE5E7EB);

  static const Color gray300 = Color(0xFFD1D5DB);

  static const Color gray400 = Color(0xFF9CA3AF);

  static const Color gray500 = Color(0xFF6B7280);

  static const Color gray600 = Color(0xFF4B5563);

  static const Color gray700 = Color(0xFF374151);

  static const Color gray800 = Color(0xFF1F2937);

  static const Color gray900 = Color(0xFF111827);

  // ==========================================================
  // BASIC
  // ==========================================================

  static const Color white = Colors.white;

  static const Color black = Colors.black;

  static const Color transparent = Colors.transparent;

  // ==========================================================
  // SHADOW
  // ==========================================================

  static Color shadow = Colors.black.withValues(alpha: 0.08);

  // ==========================================================
  // OVERLAY
  // ==========================================================

  static Color overlay = Colors.black.withValues(alpha: 0.45);

  // ==========================================================
  // GRADIENT
  // ==========================================================

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryLight],
  );

  static const LinearGradient goldGradient = LinearGradient(
    colors: [secondary, secondaryLight],
  );
}
