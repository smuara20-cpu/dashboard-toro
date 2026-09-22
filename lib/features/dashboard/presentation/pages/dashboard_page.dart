import 'package:flutter/material.dart';

import '../../../../core/theme/app_breakpoints.dart';
import '../../../../shared/layout/app_sidebar.dart';
import 'dashboard_content.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = AppBreakpoints.isCompact(constraints.maxWidth);

        return Scaffold(
          drawer: compact ? const Drawer(child: AppSidebar()) : null,
          body: SafeArea(
            child: Row(
              children: [
                if (!compact) const AppSidebar(),
                const Expanded(child: DashboardContent()),
              ],
            ),
          ),
        );
      },
    );
  }
}
