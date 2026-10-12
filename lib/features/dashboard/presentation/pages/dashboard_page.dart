import 'package:flutter/material.dart';

import 'dashboard_content.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // The authenticated AppShell owns the sidebar and responsive drawer.
    return const DashboardContent();
  }
}
