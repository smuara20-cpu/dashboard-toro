import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_typography.dart';

import 'theme_extensions/app_appbar_theme.dart';
import 'theme_extensions/app_bottom_nav_theme.dart';
import 'theme_extensions/app_button_theme.dart';
import 'theme_extensions/app_card_theme.dart';
import 'theme_extensions/app_color_scheme.dart';
import 'theme_extensions/app_divider_theme.dart';
import 'theme_extensions/app_icon_theme.dart';
import 'theme_extensions/app_input_theme.dart';
import 'theme_extensions/app_progress_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
    useMaterial3: true,

    brightness: Brightness.light,

    fontFamily: AppTypography.fontFamily,

    colorScheme: AppColorScheme.light,

    scaffoldBackgroundColor: AppColors.background,

    appBarTheme: AppAppBarTheme.light,

    cardTheme: AppCardTheme.light,

    inputDecorationTheme: AppInputTheme.light,

    elevatedButtonTheme: AppButtonTheme.elevated,

    outlinedButtonTheme: AppButtonTheme.outlined,

    textButtonTheme: AppButtonTheme.text,

    iconTheme: AppIconTheme.light,

    dividerTheme: AppDividerTheme.light,

    progressIndicatorTheme: AppProgressTheme.light,

    bottomNavigationBarTheme: AppBottomNavigationTheme.light,

    textTheme: AppTypography.textTheme,
  );
}
