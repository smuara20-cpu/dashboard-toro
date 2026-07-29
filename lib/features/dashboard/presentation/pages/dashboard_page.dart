import 'package:flutter/material.dart';

import '../../../../shared/layout/app_sidebar.dart';
import 'dashboard_content.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            AppSidebar(),
            Expanded(child: DashboardContent()),
          ],
        ),
      ),
    );
  }
}
