import 'package:flutter/material.dart';

import '../kpi_card.dart';

class DashboardKpiSection extends StatelessWidget {
  const DashboardKpiSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        KpiCard(
          title: 'Total Jamaah',
          value: '1.245',
          color: colors.primary,
          icon: Icons.people,
        ),
        KpiCard(
          title: 'Booking Hari Ini',
          value: '32',
          color: colors.tertiary,
          icon: Icons.book_online,
        ),
        KpiCard(
          title: 'Lunas',
          value: '864',
          color: Theme.of(context).brightness == Brightness.dark
              ? const Color(0xFF63D6A3)
              : const Color(0xFF16845B),
          icon: Icons.check_circle,
        ),
        KpiCard(
          title: 'Outstanding',
          value: '381',
          color: colors.error,
          icon: Icons.warning_amber_rounded,
        ),
      ],
    );
  }
}
