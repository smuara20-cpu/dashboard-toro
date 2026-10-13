import 'package:flutter/material.dart';

import '../../../../core/theme/app_breakpoints.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../shared/animations/fade_slide_in.dart';

import '../widgets/app_header.dart';
import '../widgets/prayer_time_card.dart';
import '../widgets/schedule_card.dart';

import '../widgets/cards/cashflow_card.dart';
import '../widgets/cards/marketing_card.dart';
import '../widgets/cards/today_summary_card.dart';

import '../widgets/charts/booking_chart_card.dart';
import '../widgets/charts/revenue_chart_card.dart';

import '../widgets/menu/quick_menu.dart';

import '../widgets/sections/kpi_section.dart';

import '../widgets/tables/departure_table.dart';
import '../widgets/tables/recent_booking_table.dart';
import '../widgets/tables/recent_leads_table.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: FadeSlideIn(
        duration: const Duration(milliseconds: 450),
        offsetY: 12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppHeader(),
            const SizedBox(height: AppSpacing.lg),

            // Ringkasan KPI
            const DashboardKpiSection(),
            const SizedBox(height: AppSpacing.lg),

            // Ringkasan aktivitas hari ini
            const TodaySummaryCard(),
            const SizedBox(height: AppSpacing.lg),

            // Grafik revenue dan booking
            const _ResponsivePair(
              first: RevenueChartCard(),
              second: BookingChartCard(),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Menu akses cepat
            const QuickMenu(),
            const SizedBox(height: AppSpacing.lg),

            // Marketing dan arus kas
            const _ResponsivePair(
              first: MarketingCard(),
              second: CashflowCard(),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Jadwal dan waktu salat
            const _ResponsivePair(
              first: ScheduleCard(),
              second: PrayerTimeCard(),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Tabel aktivitas
            const RecentBookingTable(),
            const SizedBox(height: AppSpacing.lg),

            const RecentLeadsTable(),
            const SizedBox(height: AppSpacing.lg),

            const DepartureTable(),
            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
    );
  }
}

class _ResponsivePair extends StatelessWidget {
  final Widget first;
  final Widget second;

  const _ResponsivePair({required this.first, required this.second});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (AppBreakpoints.isCompact(constraints.maxWidth)) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              first,
              const SizedBox(height: AppSpacing.md),
              second,
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: first),
            const SizedBox(width: AppSpacing.md),
            Expanded(child: second),
          ],
        );
      },
    );
  }
}
