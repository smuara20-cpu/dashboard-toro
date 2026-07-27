import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor: AppColors.background,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
    ),

    cardTheme: const CardThemeData(
      elevation: 2,
      color: Colors.white,
      margin: EdgeInsets.zero,
    ),
  );
}