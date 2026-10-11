import 'package:flutter/material.dart';

import '../../../../../../foundation/theme/theme_extensions.dart';
import '../common/custom_card.dart';
import '../common/section_title.dart';

class TodaySummaryCard extends StatelessWidget {
  const TodaySummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final semantic = context.ventraColors;

    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: "Today's Summary",
            subtitle: 'Ringkasan operasional hari ini',
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              final items = [
                _SummaryItem(
                  title: 'Booking',
                  value: '12',
                  icon: Icons.book_online,
                  color: colors.primary,
                ),
                _SummaryItem(
                  title: 'DP',
                  value: '8',
                  icon: Icons.payments,
                  color: semantic.warning,
                ),
                _SummaryItem(
                  title: 'Lunas',
                  value: '5',
                  icon: Icons.check_circle,
                  color: semantic.success,
                ),
                _SummaryItem(
                  title: 'Berangkat',
                  value: '2',
                  icon: Icons.flight_takeoff,
                  color: colors.tertiary,
                ),
              ];

              if (constraints.maxWidth < 480) {
                return Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  runSpacing: 24,
                  spacing: 16,
                  children: items
                      .map(
                        (item) => SizedBox(
                          width: (constraints.maxWidth - 16) / 2,
                          child: item,
                        ),
                      )
                      .toList(),
                );
              }

              return Row(
                children: items.map((item) => Expanded(child: item)).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _SummaryItem({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Icon(icon, size: 23, color: color),
        ),
        const SizedBox(height: 10),
        Text(
          value,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
