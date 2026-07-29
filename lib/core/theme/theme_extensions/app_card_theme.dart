import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_radius.dart';

class AppCardTheme {
  AppCardTheme._();

  static final light = CardThemeData(
    elevation: 0,
    color: AppColors.card,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.lg),
    ),
  );
}
