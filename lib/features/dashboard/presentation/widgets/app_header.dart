import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/route_paths.dart';
import '../../../../app/theme/theme_mode_controller.dart';
import '../../../../core/theme/app_breakpoints.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../auth/application/providers/session_provider.dart';
import '../../../../shared/layout/app_shell.dart';

class AppHeader extends ConsumerWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = AppBreakpoints.isCompact(constraints.maxWidth);

        if (compact) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const AppShellMenuButton(),
                  const SizedBox(width: AppSpacing.xs),
                  Expanded(
                    child: Text(
                      'CEO Dashboard',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                  const _ThemeModeMenu(),
                  const SizedBox(width: AppSpacing.sm),
                  const Icon(Icons.notifications_none),
                  const SizedBox(width: AppSpacing.md),
                  const _ProfileMenu(),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Cari...',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ],
          );
        }

        return Row(
          children: [
            Expanded(
              child: Text(
                'CEO Dashboard',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari...',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.lg),
            const _ThemeModeMenu(),
            const SizedBox(width: AppSpacing.lg),
            const Icon(Icons.notifications_none),
            const SizedBox(width: AppSpacing.lg),
            const _ProfileMenu(),
          ],
        );
      },
    );
  }
}

class _ThemeModeMenu extends ConsumerWidget {
  const _ThemeModeMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMode = ref.watch(themeModeProvider);

    return PopupMenuButton<ThemeMode>(
      tooltip: 'Pilih tema tampilan',
      initialValue: selectedMode,
      onSelected: (mode) {
        ref.read(themeModeProvider.notifier).setThemeMode(mode);
      },
      itemBuilder: (context) => [
        PopupMenuItem<ThemeMode>(
          value: ThemeMode.light,
          child: _ThemeMenuItem(
            icon: Icons.light_mode_outlined,
            label: 'Light Mode',
            selected: selectedMode == ThemeMode.light,
          ),
        ),
        PopupMenuItem<ThemeMode>(
          value: ThemeMode.dark,
          child: _ThemeMenuItem(
            icon: Icons.dark_mode_outlined,
            label: 'Dark Mode',
            selected: selectedMode == ThemeMode.dark,
          ),
        ),
        PopupMenuItem<ThemeMode>(
          value: ThemeMode.system,
          child: _ThemeMenuItem(
            icon: Icons.settings_brightness_outlined,
            label: 'System Default',
            selected: selectedMode == ThemeMode.system,
          ),
        ),
      ],
      child: Tooltip(
        message: 'Pilih tema tampilan',
        child: Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            selectedMode == ThemeMode.light
                ? Icons.light_mode_outlined
                : selectedMode == ThemeMode.dark
                ? Icons.dark_mode_outlined
                : Icons.brightness_auto_outlined,
            size: 21,
          ),
        ),
      ),
    );
  }
}

class _ThemeMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;

  const _ThemeMenuItem({
    required this.icon,
    required this.label,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 12),
        Expanded(child: Text(label)),
        if (selected) ...[
          const SizedBox(width: 12),
          const Icon(Icons.check, size: 18),
        ],
      ],
    );
  }
}

class _ProfileMenu extends ConsumerWidget {
  const _ProfileMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<String>(
      tooltip: 'Menu akun',
      onSelected: (value) async {
        if (value != 'logout') return;

        await ref.read(authSessionServiceProvider).logout();

        if (context.mounted) {
          context.go(RoutePaths.login);
        }
      },
      itemBuilder: (context) => const [
        PopupMenuItem<String>(
          value: 'logout',
          child: Row(
            children: [Icon(Icons.logout), SizedBox(width: 12), Text('Keluar')],
          ),
        ),
      ],
      child: const CircleAvatar(child: Icon(Icons.person)),
    );
  }
}
