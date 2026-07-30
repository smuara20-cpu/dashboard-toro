import 'package:flutter/material.dart';

import '../../core/theme/colors/app_colors.dart';
import 'base_button.dart';

class SuccessButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  final IconData? leadingIcon;
  final IconData? trailingIcon;

  final bool loading;

  const SuccessButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      text: text,
      onPressed: onPressed,
      backgroundColor: AppColors.success,
      foregroundColor: Colors.white,
      leadingIcon: leadingIcon,
      trailingIcon: trailingIcon,
      loading: loading,
    );
  }
}
