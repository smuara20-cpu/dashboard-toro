import 'package:flutter/material.dart';

import '../../core/theme/colors/app_colors.dart';
import 'base_button.dart';

class OutlinedButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  final IconData? leadingIcon;
  final IconData? trailingIcon;

  final bool loading;
  final bool fullWidth;
  final bool enabled;

  final ButtonSize size;

  const OutlinedButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
    this.loading = false,
    this.fullWidth = true,
    this.enabled = true,
    this.size = ButtonSize.medium,
  });

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      text: text,
      onPressed: onPressed,
      backgroundColor: Colors.white,
      foregroundColor: AppColors.primary,
      borderColor: AppColors.primary,
      leadingIcon: leadingIcon,
      trailingIcon: trailingIcon,
      loading: loading,
      fullWidth: fullWidth,
      enabled: enabled,
      size: size,
    );
  }
}
