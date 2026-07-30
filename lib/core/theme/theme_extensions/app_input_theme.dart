import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
import '../app_radius.dart';

class AppInputTheme {
  AppInputTheme._();

  static final light = InputDecorationTheme(
    filled: true,
    fillColor: AppColors.white,

    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.lg),
      borderSide: const BorderSide(color: AppColors.border),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.lg),
      borderSide: const BorderSide(color: AppColors.primary, width: 2),
    ),
  );
}
