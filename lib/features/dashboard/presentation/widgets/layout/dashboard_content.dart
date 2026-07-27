import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';

import 'app_header.dart';

import '../widgets/dashboard/sections/dashboard_kpi_section.dart';

import '../widgets/dashboard/cards/today_summary_card.dart';
import '../widgets/dashboard/cards/quick_menu.dart';
import '../widgets/dashboard/cards/marketing_card.dart';
import '../widgets/dashboard/cards/cashflow_card.dart';
import '../widgets/dashboard/cards/schedule_card.dart';
import '../widgets/dashboard/cards/prayer_time_card.dart';

import '../widgets/dashboard/charts/revenue_chart_card.dart';
import '../widgets/dashboard/charts/booking_chart_card.dart';

import '../widgets/dashboard/tables/recent_booking_table.dart';
import '../widgets/dashboard/tables/recent_leads_table.dart';
import '../widgets/dashboard/tables/departure_table.dart';

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

              Expanded(
                child: RevenueChartCard(),
              ),

              SizedBox(width: AppSpacing.md),

              Expanded(
                child: BookingChartCard(),
              ),

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

              Expanded(
                child: MarketingCard(),
              ),

              SizedBox(width: AppSpacing.md),

              Expanded(
                child: CashflowCard(),
              ),

            ],
          ),

          const SizedBox(height: AppSpacing.lg),

          /// SCHEDULE & PRAYER
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(
                child: ScheduleCard(),
              ),

              SizedBox(width: AppSpacing.md),

              Expanded(
                child: PrayerTimeCard(),
              ),

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