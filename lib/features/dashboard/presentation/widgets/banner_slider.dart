import 'package:flutter/material.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: PageView(
        children: const [
          _BannerItem(
            title: "Umrah Ramah Lansia",
            subtitle: "September 2026",
            color: Colors.indigo,
          ),
          _BannerItem(
            title: "Muslim Tour Jepang",
            subtitle: "School Holiday",
            color: Colors.green,
          ),
          _BannerItem(
            title: "West Europe Exclusive",
            subtitle: "Limited Seat",
            color: Colors.deepPurple,
          ),
        ],
      ),
    );
  }
}

class _BannerItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;

  const _BannerItem({
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
