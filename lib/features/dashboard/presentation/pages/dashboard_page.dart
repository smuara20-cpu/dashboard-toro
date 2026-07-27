import 'package:flutter/material.dart';

import '../widgets/app_sidebar.dart';
import '../widgets/dashboard_content.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          AppSidebar(),
          Expanded(
            child: DashboardContent(),
          ),
        ],
      ),
    );
  }
}