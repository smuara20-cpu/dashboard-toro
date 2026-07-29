import 'package:flutter/material.dart';

import '../../domain/entities/testimonial_entity.dart';

class TestimonialCard extends StatelessWidget {
  final TestimonialEntity item;

  const TestimonialCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(radius: 26, child: Icon(Icons.person)),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),

                      Text(item.city),

                      const SizedBox(height: 4),

                      Text(
                        item.packageName,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Row(
              children: List.generate(
                item.rating.toInt(),
                (index) =>
                    const Icon(Icons.star, color: Colors.orange, size: 18),
              ),
            ),

            const SizedBox(height: 12),

            Text(item.review),

            const SizedBox(height: 12),

            Row(
              children: [
                const Icon(Icons.photo),

                const SizedBox(width: 8),

                Text("${item.photos} Foto"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
