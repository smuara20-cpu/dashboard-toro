import 'package:flutter/material.dart';
import '../colors/app_colors.dart';

class AppColorScheme {
  AppColorScheme._();

  static const light = ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    surface: AppColors.surface,
    error: AppColors.danger,
  );
}
