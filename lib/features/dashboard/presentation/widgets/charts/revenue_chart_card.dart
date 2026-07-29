import 'package:flutter/material.dart';

class RevenueChartCard extends StatelessWidget {
  const RevenueChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Revenue",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            SizedBox(
              height: 220,
              child: Center(
                child: Icon(Icons.bar_chart, size: 80, color: Colors.blue),
              ),
            ),

            SizedBox(height: 12),

            Center(
              child: Text(
                "Revenue Chart",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
