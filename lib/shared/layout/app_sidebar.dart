import 'package:flutter/material.dart';

class AppSidebar extends StatelessWidget {
  const AppSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: const Color(0xFF0B1F3A),
      child: Column(
        children: [
          const SizedBox(height: 32),

          const Text(
            "Travel ERP",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 40),

          _menu(Icons.dashboard, "Dashboard"),
          _menu(Icons.people, "CRM"),
          _menu(Icons.book_online, "Booking"),
          _menu(Icons.groups, "Jamaah"),
          _menu(Icons.flight, "Paket"),
          _menu(Icons.badge, "Visa"),
          _menu(Icons.hotel, "Hotel"),
          _menu(Icons.account_balance_wallet, "Finance"),
          _menu(Icons.analytics, "CEO Dashboard"),
          _menu(Icons.settings, "Setting"),
        ],
      ),
    );
  }

  Widget _menu(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: () {},
    );
  }
}