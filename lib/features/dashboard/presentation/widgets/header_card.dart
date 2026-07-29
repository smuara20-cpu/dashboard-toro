import 'package:flutter/material.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),

            const SizedBox(width: 16),

            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Selamat Pagi",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Suryo Hadi Saptoro",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),

            Icon(Icons.notifications_none, size: 28),
          ],
        ),
      ),
    );
  }
}
