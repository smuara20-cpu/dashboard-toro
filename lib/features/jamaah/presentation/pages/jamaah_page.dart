import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:dashboard_kpi/core/theme/app_spacing.dart';
import 'package:dashboard_kpi/features/jamaah/application/providers/jamaah_provider.dart';
import 'package:dashboard_kpi/features/jamaah/application/state/jamaah_state.dart';
import 'package:dashboard_kpi/features/jamaah/domain/value_objects/jamaah_tenant_context.dart';
import 'package:dashboard_kpi/features/jamaah/presentation/widgets/jamaah_card.dart';
import 'package:dashboard_kpi/features/jamaah/presentation/widgets/jamaah_empty_state.dart';
import 'package:dashboard_kpi/features/jamaah/presentation/widgets/jamaah_error_state.dart';
import 'package:dashboard_kpi/features/jamaah/presentation/widgets/jamaah_loading_state.dart';

class JamaahPage extends ConsumerStatefulWidget {
  final JamaahTenantContext tenantContext;

  const JamaahPage({super.key, required this.tenantContext});

  @override
  ConsumerState<JamaahPage> createState() => _JamaahPageState();
}

class _JamaahPageState extends ConsumerState<JamaahPage> {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(_initialize);
  }

  Future<void> _initialize() async {
    if (_isInitialized || !mounted) {
      return;
    }

    _isInitialized = true;

    final controller = ref.read(jamaahControllerProvider);

    await controller.initialize(tenantContext: widget.tenantContext);

    if (!mounted) {
      return;
    }

    setState(() {});
  }

  Future<void> _refresh() async {
    final controller = ref.read(jamaahControllerProvider);

    await controller.refresh(tenantContext: widget.tenantContext);

    if (!mounted) {
      return;
    }

    setState(() {});
  }

  void _openJamaahDetail(String jamaahId) {
    context.push('/jamaah/$jamaahId', extra: widget.tenantContext);
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.read(jamaahControllerProvider);
    final state = controller.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jamaah'),
        actions: [
          IconButton(
            tooltip: 'Refresh Jamaah',
            onPressed: state.isLoading ? null : _refresh,
            icon: const Icon(Icons.refresh),
          ),
          const SizedBox(width: AppSpacing.sm),
        ],
      ),
      body: SafeArea(
        child: _JamaahBody(
          state: state,
          onRefresh: _refresh,
          onJamaahTap: _openJamaahDetail,
        ),
      ),
    );
  }
}

class _JamaahBody extends StatelessWidget {
  final JamaahState state;
  final Future<void> Function() onRefresh;
  final void Function(String jamaahId) onJamaahTap;

  const _JamaahBody({
    required this.state,
    required this.onRefresh,
    required this.onJamaahTap,
  });

  @override
  Widget build(BuildContext context) {
    switch (state.status) {
      case JamaahStateStatus.initial:
      case JamaahStateStatus.loading:
        return const JamaahLoadingState();

      case JamaahStateStatus.empty:
        return RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: const [SizedBox(height: 180), JamaahEmptyState()],
          ),
        );

      case JamaahStateStatus.failure:
        return RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: [
              const SizedBox(height: 120),
              JamaahErrorState(message: state.errorMessage, onRetry: onRefresh),
            ],
          ),
        );

      case JamaahStateStatus.success:
        return RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(AppSpacing.lg),
            itemCount: state.jamaahs.length,
            separatorBuilder: (_, _) {
              return const SizedBox(height: AppSpacing.md);
            },
            itemBuilder: (context, index) {
              final jamaah = state.jamaahs[index];

              return JamaahCard(
                jamaah: jamaah,
                onTap: () => onJamaahTap(jamaah.id.value),
              );
            },
          ),
        );
    }
  }
}
