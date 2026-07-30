import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
import '../app_radius.dart';

class AppButtonTheme {
  AppButtonTheme._();

  static final ElevatedButtonThemeData elevated = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      minimumSize: const Size(double.infinity, 52),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
    ),
  );

  static final OutlinedButtonThemeData outlined = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.primary,
      side: const BorderSide(color: AppColors.primary),
    ),
  );

  static final TextButtonThemeData text = TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: AppColors.primary),
  );
}
