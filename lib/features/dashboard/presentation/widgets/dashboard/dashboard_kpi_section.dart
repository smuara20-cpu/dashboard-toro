import 'package:flutter/material.dart';

import 'kpi_card.dart';

class DashboardKpiSection extends StatelessWidget {
  const DashboardKpiSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: const [

        KpiCard(
          title: "Total Jamaah",
          value: "1.245",
          color: Colors.blue,
          icon: Icons.people,
        ),

        KpiCard(
          title: "Booking Hari Ini",
          value: "32",
          color: Colors.orange,
          icon: Icons.book_online,
        ),

        KpiCard(
          title: "Lunas",
          value: "864",
          color: Colors.green,
          icon: Icons.check_circle,
        ),

        KpiCard(
          title: "Outstanding",
          value: "381",
          color: Colors.red,
          icon: Icons.warning,
        ),
      ],
    );
  }
}