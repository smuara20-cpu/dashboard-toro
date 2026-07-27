import 'package:flutter/material.dart';

import '../../common/custom_card.dart';
import '../../common/section_title.dart';

class TodaySummaryCard extends StatelessWidget {
  const TodaySummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SectionTitle(
            title: "Today's Summary",
            subtitle: "Ringkasan operasional hari ini",
          ),

          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              _SummaryItem(
                title: "Booking",
                value: "12",
                icon: Icons.book_online,
              ),

              _SummaryItem(
                title: "DP",
                value: "8",
                icon: Icons.payments,
              ),

              _SummaryItem(
                title: "Lunas",
                value: "5",
                icon: Icons.check_circle,
              ),

              _SummaryItem(
                title: "Berangkat",
                value: "2",
                icon: Icons.flight_takeoff,
              ),
            ],
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

  const _SummaryItem({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Icon(icon, size: 32),

        SizedBox(height: 10),

        Text(
          value,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 6),

        Text(title),
      ],
    );
  }
}