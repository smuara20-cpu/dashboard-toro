import 'package:flutter/material.dart';

class PrayerTimeCard extends StatelessWidget {
  const PrayerTimeCard({super.key});

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
              "Jadwal Sholat",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 16),

            ListTile(
              leading: Icon(Icons.wb_sunny),
              title: Text("Subuh"),
              trailing: Text("04:43"),
            ),

            ListTile(
              leading: Icon(Icons.sunny),
              title: Text("Dzuhur"),
              trailing: Text("11:58"),
            ),

            ListTile(
              leading: Icon(Icons.wb_twilight),
              title: Text("Ashar"),
              trailing: Text("15:20"),
            ),

            ListTile(
              leading: Icon(Icons.nightlight),
              title: Text("Maghrib"),
              trailing: Text("17:52"),
            ),

            ListTile(
              leading: Icon(Icons.dark_mode),
              title: Text("Isya"),
              trailing: Text("19:05"),
            ),
          ],
        ),
      ),
    );
  }
}
