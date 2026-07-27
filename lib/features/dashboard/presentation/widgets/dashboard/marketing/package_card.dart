import 'package:flutter/material.dart';

import '../common/custom_card.dart';
import '../common/section_title.dart';

class PackageCard extends StatelessWidget {
  const PackageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SectionTitle(
            title: "Best Selling Packages",
            icon: Icons.card_travel,
          ),

          SizedBox(height: 20),

          _PackageItem(
            title: "Umrah Ramah Lansia",
            seat: "32 Seat",
            price: "Rp31 Juta",
          ),

          Divider(),

          _PackageItem(
            title: "Umrah Plus Turki",
            seat: "18 Seat",
            price: "Rp95 Juta",
          ),

          Divider(),

          _PackageItem(
            title: "West Europe Muslim Tour",
            seat: "12 Seat",
            price: "Rp58 Juta",
          ),
        ],
      ),
    );
  }
}

class _PackageItem extends StatelessWidget {
  final String title;
  final String seat;
  final String price;

  const _PackageItem({
    required this.title,
    required this.seat,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        child: Icon(Icons.flight),
      ),
      title: Text(title),
      subtitle: Text(seat),
      trailing: Text(
        price,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
      ),
    );
  }
}