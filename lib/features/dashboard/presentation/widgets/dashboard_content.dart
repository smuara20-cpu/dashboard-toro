import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import 'app_header.dart';
import 'dashboard/dashboard_kpi_section.dart';
import 'dashboard/quick_menu.dart';
import 'dashboard/marketing_card.dart';
import 'dashboard/cashflow_card.dart';
import 'dashboard/schedule_card.dart';
import 'dashboard/prayer_time_card.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [

          /// Header
          AppHeader(),

          SizedBox(height: AppSpacing.lg),

          /// KPI
          DashboardKpiSection(),

          SizedBox(height: AppSpacing.lg),

          /// Quick Menu
          QuickMenu(),

          SizedBox(height: AppSpacing.lg),

          /// Marketing & Cashflow
          Row(
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

          SizedBox(height: AppSpacing.lg),

          /// Schedule & Prayer Time
          Row(
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

        ],
      ),
    );
  }
}