import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const heading = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static const title = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static const body = TextStyle(
    fontSize: 16,
    color: AppColors.black,
  );

  static const caption = TextStyle(
    fontSize: 13,
    color: AppColors.grey,
  );
}