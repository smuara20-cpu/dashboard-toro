import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/route_paths.dart';

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
            'Travel ERP',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 40),

          _menu(
            context,
            Icons.dashboard,
            'Dashboard',
            RoutePaths.dashboard,
          ),

          _menu(
            context,
            Icons.people,
            'CRM',
          ),

          _menu(
            context,
            Icons.book_online,
            'Booking',
            RoutePaths.booking,
          ),

          _menu(
            context,
            Icons.groups,
            'Jamaah',
            RoutePaths.jamaah,
          ),

          _menu(
            context,
            Icons.flight,
            'Paket',
          ),

          _menu(
            context,
            Icons.badge,
            'Visa',
          ),

          _menu(
            context,
            Icons.hotel,
            'Hotel',
          ),

          _menu(
            context,
            Icons.account_balance_wallet,
            'Finance',
            RoutePaths.finance,
          ),

          _menu(
            context,
            Icons.analytics,
            'CEO Dashboard',
            RoutePaths.dashboard,
          ),

          _menu(
            context,
            Icons.settings,
            'Setting',
          ),
        ],
      ),
    );
  }

  Widget _menu(
      BuildContext context,
      IconData icon,
      String title, [
        String? route,
      ]) {
    final enabled = route != null;

    return ListTile(
      leading: Icon(
        icon,
        color: enabled ? Colors.white : Colors.white54,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: enabled ? Colors.white : Colors.white54,
        ),
      ),
      enabled: enabled,
      onTap: enabled
          ? () {
        context.go(route);
      }
          : null,
    );
  }
}