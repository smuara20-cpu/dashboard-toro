import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_card.dart';
import '../../../../../core/widgets/section_title.dart';

class RevenueChartCard extends StatelessWidget {
  const RevenueChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: "Revenue",
            subtitle: "Pendapatan 7 Hari Terakhir",
          ),

          const SizedBox(height: 24),

          SizedBox(
            height: 260,
            child: LineChart(
              LineChartData(
                borderData: FlBorderData(show: false),

                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                ),

                titlesData: FlTitlesData(
                  topTitles: const AxisTitles(),
                  rightTitles: const AxisTitles(),

                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 42,
                    ),
                  ),

                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const days = [
                          'Mon',
                          'Tue',
                          'Wed',
                          'Thu',
                          'Fri',
                          'Sat',
                          'Sun'
                        ];

                        if (value.toInt() >= days.length) {
                          return const SizedBox();
                        }

                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(days[value.toInt()]),
                        );
                      },
                    ),
                  ),
                ),

                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,

                    color: Colors.blue,

                    barWidth: 4,

                    dotData: const FlDotData(show: true),

                    spots: const [
                      FlSpot(0, 12),
                      FlSpot(1, 18),
                      FlSpot(2, 16),
                      FlSpot(3, 28),
                      FlSpot(4, 24),
                      FlSpot(5, 35),
                      FlSpot(6, 42),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}