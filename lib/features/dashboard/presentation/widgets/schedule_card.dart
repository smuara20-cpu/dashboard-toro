import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Keberangkatan Terdekat",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.flight_takeoff),
              title: Text("Umroh Agustus"),
              subtitle: Text("15 Agustus 2026"),
            ),
            ListTile(
              leading: Icon(Icons.flight_takeoff),
              title: Text("Muslim Tour Jepang"),
              subtitle: Text("28 September 2026"),
            ),
          ],
        ),
      ),
    );
  }
}
