import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
import '../app_typography.dart';

class AppAppBarTheme {
  AppAppBarTheme._();

  static final light = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    backgroundColor: AppColors.surface,
    foregroundColor: AppColors.textPrimary,
    surfaceTintColor: Colors.transparent,
    titleTextStyle: AppTypography.titleLarge,
  );
}
