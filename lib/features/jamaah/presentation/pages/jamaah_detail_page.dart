import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dashboard_kpi/core/theme/app_spacing.dart';
import 'package:dashboard_kpi/core/theme/colors/app_colors.dart';
import 'package:dashboard_kpi/features/jamaah/application/providers/jamaah_provider.dart';
import 'package:dashboard_kpi/features/jamaah/application/state/jamaah_state.dart';
import 'package:dashboard_kpi/features/jamaah/domain/value_objects/jamaah_id.dart';
import 'package:dashboard_kpi/features/jamaah/domain/value_objects/jamaah_tenant_context.dart';
import 'package:dashboard_kpi/features/jamaah/presentation/widgets/jamaah_loading_state.dart';

class JamaahDetailPage extends ConsumerStatefulWidget {
  final String jamaahId;
  final JamaahTenantContext tenantContext;

  const JamaahDetailPage({
    super.key,
    required this.jamaahId,
    required this.tenantContext,
  });

  @override
  ConsumerState<JamaahDetailPage> createState() => _JamaahDetailPageState();
}

class _JamaahDetailPageState extends ConsumerState<JamaahDetailPage> {
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

    await controller.loadById(
      id: JamaahId(widget.jamaahId),
      tenantContext: widget.tenantContext,
    );

    if (!mounted) {
      return;
    }

    setState(() {});
  }

  Future<void> _retry() async {
    _isInitialized = false;
    await _initialize();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.read(jamaahControllerProvider);
    final state = controller.state;

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Jamaah')),
      body: SafeArea(
        child: _JamaahDetailBody(state: state, onRetry: _retry),
      ),
    );
  }
}

class _JamaahDetailBody extends StatelessWidget {
  final JamaahState state;
  final Future<void> Function() onRetry;

  const _JamaahDetailBody({required this.state, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    if (state.status == JamaahStateStatus.loading ||
        state.status == JamaahStateStatus.initial) {
      return const JamaahLoadingState();
    }

    if (state.status == JamaahStateStatus.failure) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline,
                size: 48,
                color: AppColors.danger,
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Gagal memuat detail Jamaah',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.md),
              OutlinedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Coba Lagi'),
              ),
            ],
          ),
        ),
      );
    }

    final jamaah = state.selectedJamaah;

    if (jamaah == null) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.xl),
          child: Text(
            'Data Jamaah tidak ditemukan.',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                jamaah.businessNumber.value,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              _DetailRow(
                label: 'Customer Reference',
                value: jamaah.customerReference.value,
              ),
              _DetailRow(label: 'Status', value: jamaah.status.value),
              _DetailRow(label: 'Lifecycle', value: jamaah.lifecycle.value),
              _DetailRow(
                label: 'Dibuat',
                value: jamaah.audit.createdAt.toLocal().toString(),
              ),
              _DetailRow(
                label: 'Diperbarui',
                value: jamaah.audit.updatedAt.toLocal().toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            value,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColors.textPrimary),
          ),
        ],
      ),
    );
  }
}
