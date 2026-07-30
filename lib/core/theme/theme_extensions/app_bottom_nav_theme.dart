import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class AppBottomNavigationTheme {
  AppBottomNavigationTheme._();

  static const BottomNavigationBarThemeData light =
      BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.gray500,
        backgroundColor: Colors.white,
        elevation: 10,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      );
}
