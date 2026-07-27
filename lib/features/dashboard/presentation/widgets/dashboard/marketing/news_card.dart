import 'package:flutter/material.dart';

import '../common/custom_card.dart';
import '../common/section_title.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SectionTitle(
            title: "Travel News",
            icon: Icons.newspaper,
          ),
          SizedBox(height: 20),

          ListTile(
            leading: Icon(Icons.flight_takeoff),
            title: Text("Saudi membuka kuota tambahan"),
            subtitle: Text("2 jam yang lalu"),
          ),

          Divider(),

          ListTile(
            leading: Icon(Icons.airplane_ticket),
            title: Text("Harga tiket umrah turun"),
            subtitle: Text("Hari ini"),
          ),

          Divider(),

          ListTile(
            leading: Icon(Icons.public),
            title: Text("Visa multiple entry diperpanjang"),
            subtitle: Text("Kemarin"),
          ),
        ],
      ),
    );
  }
}