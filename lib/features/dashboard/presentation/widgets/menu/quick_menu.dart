import 'package:flutter/material.dart';

class QuickMenu extends StatelessWidget {
  const QuickMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _menu(Icons.people, "Jamaah"),
            _menu(Icons.flight, "Paket"),
            _menu(Icons.receipt_long, "Invoice"),
            _menu(Icons.account_balance_wallet, "Finance"),
            _menu(Icons.campaign, "Meta Ads"),
            _menu(Icons.analytics, "CEO"),
          ],
        ),
      ),
    );
  }

  Widget _menu(IconData icon, String title) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          CircleAvatar(radius: 28, child: Icon(icon)),
          const SizedBox(height: 8),
          Text(title),
        ],
      ),
    );
  }
}
