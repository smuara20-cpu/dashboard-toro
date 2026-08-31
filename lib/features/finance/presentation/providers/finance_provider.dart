import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dashboard_kpi/app/dependency/service_locator.dart';
import 'package:dashboard_kpi/features/finance/presentation/controllers/finance_controller.dart';
import 'package:dashboard_kpi/features/finance/presentation/state/finance_state.dart';

final financeControllerProvider = Provider.autoDispose<FinanceController>((
  ref,
) {
  final controller = sl<FinanceController>();

  ref.onDispose(() {
    // FinanceController currently has no disposable resources.
    // Keep lifecycle ownership here so lifecycle management
    // can be extended safely without changing consumers.
  });

  return controller;
});

final financeStateProvider = Provider.autoDispose<FinanceState>((ref) {
  final controller = ref.watch(financeControllerProvider);

  return controller.state;
});
