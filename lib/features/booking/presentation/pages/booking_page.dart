import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:dashboard_kpi/core/theme/app_spacing.dart';
import 'package:dashboard_kpi/core/theme/colors/app_colors.dart';
import 'package:dashboard_kpi/features/booking/application/providers/booking_provider.dart';
import 'package:dashboard_kpi/features/booking/application/state/booking_state.dart';
import 'package:dashboard_kpi/features/booking/presentation/widgets/booking_list_item.dart';

class BookingPage extends ConsumerStatefulWidget {
  const BookingPage({super.key});

  @override
  ConsumerState<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends ConsumerState<BookingPage> {
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

    final controller = ref.read(bookingControllerProvider);

    await controller.initialize();

    if (!mounted) {
      return;
    }

    setState(() {});
  }

  Future<void> _refresh() async {
    final controller = ref.read(bookingControllerProvider);

    await controller.refresh();

    if (!mounted) {
      return;
    }

    setState(() {});
  }

  void _openBookingDetail(String bookingId) {
    context.push('/booking/$bookingId');
  }

  Future<void> _openCreateBooking() async {
    final created = await context.push<bool>('/booking/create');

    if (!mounted || created != true) {
      return;
    }

    await _refresh();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.read(bookingControllerProvider);
    final state = controller.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking'),
        actions: [
          FilledButton.icon(
            onPressed: _openCreateBooking,
            icon: const Icon(Icons.add),
            label: const Text('Booking Baru'),
          ),
          const SizedBox(width: AppSpacing.sm),
          IconButton(
            tooltip: 'Refresh booking',
            onPressed: state.status == BookingStatus.loading ? null : _refresh,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: SafeArea(
        child: _BookingBody(
          state: state,
          onRefresh: _refresh,
          onBookingTap: _openBookingDetail,
        ),
      ),
    );
  }
}

class _BookingBody extends StatelessWidget {
  final BookingState state;
  final Future<void> Function() onRefresh;
  final void Function(String bookingId) onBookingTap;

  const _BookingBody({
    required this.state,
    required this.onRefresh,
    required this.onBookingTap,
  });

  @override
  Widget build(BuildContext context) {
    switch (state.status) {
      case BookingStatus.initial:
      case BookingStatus.loading:
        return const Center(child: CircularProgressIndicator());

      case BookingStatus.empty:
        return RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: const [SizedBox(height: 180), _BookingEmptyState()],
          ),
        );

      case BookingStatus.failure:
        return RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: [
              const SizedBox(height: 120),
              _BookingErrorState(message: state.errorMessage),
            ],
          ),
        );

      case BookingStatus.success:
        return RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(AppSpacing.lg),
            itemCount: state.bookings.length,
            separatorBuilder: (_, _) {
              return const SizedBox(height: AppSpacing.md);
            },
            itemBuilder: (context, index) {
              final booking = state.bookings[index];

              return InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => onBookingTap(booking.id),
                child: BookingListItem(booking: booking),
              );
            },
          ),
        );
    }
  }
}

class _BookingEmptyState extends StatelessWidget {
  const _BookingEmptyState();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.event_note_outlined,
          size: 48,
          color: AppColors.textSecondary,
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          'Belum ada booking',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Data booking belum tersedia.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _BookingErrorState extends StatelessWidget {
  final String? message;

  const _BookingErrorState({this.message});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.error_outline, size: 48, color: AppColors.danger),
        const SizedBox(height: AppSpacing.md),
        Text(
          'Gagal memuat booking',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
          textAlign: TextAlign.center,
        ),
        if (message != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            message!,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}
