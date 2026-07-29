import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text(
            "CEO Dashboard",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),

        SizedBox(
          width: 300,
          child: TextField(
            decoration: InputDecoration(
              hintText: "Cari...",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),

        const SizedBox(width: 20),

        const Icon(Icons.notifications_none),

        const SizedBox(width: 20),

        const CircleAvatar(child: Icon(Icons.person)),
      ],
    );
  }
}
