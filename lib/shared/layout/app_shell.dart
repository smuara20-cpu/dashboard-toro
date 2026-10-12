import 'package:flutter/material.dart';

import '../../core/theme/app_breakpoints.dart';
import 'app_sidebar.dart';

/// Shared responsive shell for authenticated VENTRA pages.
class AppShell extends StatefulWidget {
  final Widget child;

  const AppShell({required this.child, super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = AppBreakpoints.isCompact(constraints.maxWidth);

        return _AppShellScope(
          openDrawer: _openDrawer,
          child: Scaffold(
            key: _scaffoldKey,
            drawer: compact
                ? const Drawer(width: 280, child: AppSidebar())
                : null,
            body: SafeArea(
              child: Row(
                children: [
                  if (!compact) const AppSidebar(),
                  Expanded(child: widget.child),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _AppShellScope extends InheritedWidget {
  final VoidCallback openDrawer;

  const _AppShellScope({required this.openDrawer, required super.child});

  static _AppShellScope? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_AppShellScope>();
  }

  @override
  bool updateShouldNotify(_AppShellScope oldWidget) => false;
}

/// Mobile navigation button for pages that do not have a back button.
class AppShellMenuButton extends StatelessWidget {
  const AppShellMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    final compact = AppBreakpoints.isCompact(MediaQuery.sizeOf(context).width);

    if (!compact) {
      return const SizedBox.shrink();
    }

    return IconButton(
      tooltip: 'Buka navigasi',
      icon: const Icon(Icons.menu),
      onPressed: () {
        _AppShellScope.maybeOf(context)?.openDrawer();
      },
    );
  }
}
