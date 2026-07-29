import 'package:flutter/material.dart';

class BookingChartCard extends StatelessWidget {
  const BookingChartCard({super.key});

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
              "Booking",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            SizedBox(
              height: 220,
              child: Center(
                child: Icon(Icons.show_chart, size: 80, color: Colors.orange),
              ),
            ),

            SizedBox(height: 12),

            Center(
              child: Text(
                "Booking Chart",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
