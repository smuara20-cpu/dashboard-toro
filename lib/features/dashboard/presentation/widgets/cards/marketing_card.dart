import 'package:flutter/material.dart';

class MarketingCard extends StatelessWidget {
  const MarketingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Marketing",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListTile(title: Text("Leads Hari Ini"), trailing: Text("45")),
            ListTile(title: Text("Booking"), trailing: Text("12")),
            ListTile(title: Text("ROAS"), trailing: Text("5.8x")),
          ],
        ),
      ),
    );
  }
}
