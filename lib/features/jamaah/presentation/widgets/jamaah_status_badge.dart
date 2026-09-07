import 'package:flutter/material.dart';

import 'package:dashboard_kpi/core/theme/colors/app_colors.dart';

class JamaahStatusBadge extends StatelessWidget {
  final String status;

  const JamaahStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final normalized = status.trim().toLowerCase();

    final Color foreground;
    final Color background;

    switch (normalized) {
      case 'active':
      case 'aktif':
        foreground = AppColors.success;
        background = AppColors.success.withValues(alpha: 0.10);
        break;

      case 'inactive':
      case 'nonaktif':
      case 'cancelled':
        foreground = AppColors.danger;
        background = AppColors.danger.withValues(alpha: 0.10);
        break;

      default:
        foreground = AppColors.textSecondary;
        background = AppColors.textSecondary.withValues(alpha: 0.10);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        status,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          fontWeight: FontWeight.w700,
          color: foreground,
        ),
      ),
    );
  }
}
