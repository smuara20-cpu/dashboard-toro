import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class AppDividerTheme {
  AppDividerTheme._();

  static const DividerThemeData light = DividerThemeData(
    color: AppColors.divider,
    thickness: 1,
    space: 1,
  );
}
