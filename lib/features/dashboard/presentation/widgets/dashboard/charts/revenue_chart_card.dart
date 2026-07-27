import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_card.dart';
import '../../../../../core/widgets/section_title.dart';

class BookingChartCard extends StatelessWidget {
  const BookingChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: "Booking",
            subtitle: "Jumlah Booking Bulanan",
          ),

          const SizedBox(height: 24),

          SizedBox(
            height: 260,
            child: BarChart(
              BarChartData(
                borderData: FlBorderData(show: false),

                gridData: FlGridData(show: true),

                titlesData: FlTitlesData(
                  topTitles: const AxisTitles(),
                  rightTitles: const AxisTitles(),

                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const month = [
                          "Jan",
                          "Feb",
                          "Mar",
                          "Apr",
                          "Mei",
                          "Jun"
                        ];

                        if (value.toInt() >= month.length) {
                          return const SizedBox();
                        }

                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(month[value.toInt()]),
                        );
                      },
                    ),
                  ),
                ),

                barGroups: [
                  BarChartGroupData(
                    x: 0,
                    barRods: [
                      BarChartRodData(
                        toY: 12,
                        color: Colors.blue,
                        width: 18,
                        borderRadius: BorderRadius.circular(6),
                      )
                    ],
                  ),

                  BarChartGroupData(
                    x: 1,
                    barRods: [
                      BarChartRodData(
                        toY: 18,
                        color: Colors.green,
                        width: 18,
                        borderRadius: BorderRadius.circular(6),
                      )
                    ],
                  ),

                  BarChartGroupData(
                    x: 2,
                    barRods: [
                      BarChartRodData(
                        toY: 24,
                        color: Colors.orange,
                        width: 18,
                        borderRadius: BorderRadius.circular(6),
                      )
                    ],
                  ),

                  BarChartGroupData(
                    x: 3,
                    barRods: [
                      BarChartRodData(
                        toY: 16,
                        color: Colors.red,
                        width: 18,
                        borderRadius: BorderRadius.circular(6),
                      )
                    ],
                  ),

                  BarChartGroupData(
                    x: 4,
                    barRods: [
                      BarChartRodData(
                        toY: 28,
                        color: Colors.purple,
                        width: 18,
                        borderRadius: BorderRadius.circular(6),
                      )
                    ],
                  ),

                  BarChartGroupData(
                    x: 5,
                    barRods: [
                      BarChartRodData(
                        toY: 36,
                        color: Colors.teal,
                        width: 18,
                        borderRadius: BorderRadius.circular(6),
                      )
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