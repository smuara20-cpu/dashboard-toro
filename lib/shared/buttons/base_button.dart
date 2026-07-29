import 'package:flutter/material.dart';

import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';

enum ButtonVariant { primary, secondary, outlined, danger, success }

enum ButtonSize { small, medium, large }

class BaseButton extends StatelessWidget {
  final String text;

  final VoidCallback? onPressed;

  final Color backgroundColor;

  final Color foregroundColor;

  final Color? borderColor;

  final IconData? leadingIcon;

  final IconData? trailingIcon;

  final bool fullWidth;

  final bool enabled;

  final bool loading;

  final ButtonSize size;

  const BaseButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.foregroundColor,
    this.borderColor,
    this.leadingIcon,
    this.trailingIcon,
    this.fullWidth = true,
    this.enabled = true,
    this.loading = false,
    this.size = ButtonSize.medium,
  });

  double get height {
    switch (size) {
      case ButtonSize.small:
        return 40;

      case ButtonSize.medium:
        return 48;

      case ButtonSize.large:
        return 56;
    }
  }

  EdgeInsets get padding {
    switch (size) {
      case ButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 16);

      case ButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 20);

      case ButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 24);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      height: height,
      child: ElevatedButton(
        onPressed: enabled && !loading ? onPressed : null,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: padding,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.lg),
            side: borderColor == null
                ? BorderSide.none
                : BorderSide(color: borderColor!),
          ),
        ),
        child: loading
            ? SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation(foregroundColor),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (leadingIcon != null) ...[
                    Icon(leadingIcon, size: 20),
                    SizedBox(width: AppSpacing.sm),
                  ],

                  Text(
                    text,
                    style: AppTypography.labelLarge.copyWith(
                      color: foregroundColor,
                    ),
                  ),

                  if (trailingIcon != null) ...[
                    SizedBox(width: AppSpacing.sm),
                    Icon(trailingIcon, size: 20),
                  ],
                ],
              ),
      ),
    );
  }
}
