import 'package:flutter/material.dart';

import 'package:dashboard_kpi/core/theme/app_radius.dart';
import 'package:dashboard_kpi/core/theme/app_spacing.dart';
import 'package:dashboard_kpi/core/theme/colors/app_colors.dart';

import '../../domain/entities/booking_entity.dart';

class BookingListItem extends StatelessWidget {
  final BookingEntity booking;

  const BookingListItem({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    booking.bookingCode,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                _BookingStatusBadge(status: booking.status.name),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              booking.customer.fullName,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              booking.package.packageName,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: _BookingInfo(
                    label: 'Departure',
                    value: _formatDate(booking.departureDate),
                  ),
                ),
                Expanded(
                  child: _BookingInfo(
                    label: 'Payment',
                    value:
                        '${booking.payment.paidAmount.toStringAsFixed(0)} '
                        '${booking.payment.currency}',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }
}

class _BookingInfo extends StatelessWidget {
  final String label;
  final String value;

  const _BookingInfo({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}

class _BookingStatusBadge extends StatelessWidget {
  final String status;

  const _BookingStatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final normalizedStatus = status.toLowerCase();

    final Color background;
    final Color foreground;

    switch (normalizedStatus) {
      case 'confirmed':
        background = AppColors.success.withValues(alpha: 0.12);
        foreground = AppColors.success;
        break;
      case 'pending':
        background = AppColors.warning.withValues(alpha: 0.12);
        foreground = AppColors.warning;
        break;
      case 'cancelled':
      case 'canceled':
        background = AppColors.danger.withValues(alpha: 0.12);
        foreground = AppColors.danger;
        break;
      default:
        background = AppColors.gray100;
        foreground = AppColors.gray600;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Text(
        status.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: foreground,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
