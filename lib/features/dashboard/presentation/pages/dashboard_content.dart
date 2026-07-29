import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// HEADER
          const AppHeader(),

          const SizedBox(height: AppSpacing.lg),

          /// KPI
          const DashboardKpiSection(),

          const SizedBox(height: AppSpacing.lg),

          /// TODAY SUMMARY
          const TodaySummaryCard(),

          const SizedBox(height: AppSpacing.lg),

          /// CHARTS
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: RevenueChartCard()),

              SizedBox(width: AppSpacing.md),

              Expanded(child: BookingChartCard()),
            ],
          ),

          const SizedBox(height: AppSpacing.lg),

          /// QUICK MENU
          const QuickMenu(),

          const SizedBox(height: AppSpacing.lg),

          /// MARKETING & CASHFLOW
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: MarketingCard()),

              SizedBox(width: AppSpacing.md),

              Expanded(child: CashflowCard()),
            ],
          ),

          const SizedBox(height: AppSpacing.lg),

          /// SCHEDULE & PRAYER
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: ScheduleCard()),

              SizedBox(width: AppSpacing.md),

              Expanded(child: PrayerTimeCard()),
            ],
          ),

          const SizedBox(height: AppSpacing.lg),

          /// RECENT BOOKING
          const RecentBookingTable(),

          const SizedBox(height: AppSpacing.lg),

          /// RECENT LEADS
          const RecentLeadsTable(),

          const SizedBox(height: AppSpacing.lg),

          /// DEPARTURE
          const DepartureTable(),

          const SizedBox(height: AppSpacing.xxl),
        ],
      ),
    );
  }
}
