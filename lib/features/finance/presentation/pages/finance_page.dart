import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dashboard_kpi/features/finance/presentation/providers/finance_provider.dart';
import 'package:dashboard_kpi/features/finance/presentation/state/finance_state.dart';
import 'package:dashboard_kpi/features/finance/presentation/widgets/finance_summary_card.dart';

class FinancePage extends ConsumerStatefulWidget {
  const FinancePage({super.key});

  @override
  ConsumerState<FinancePage> createState() => _FinancePageState();
}

class _FinancePageState extends ConsumerState<FinancePage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      if (!mounted) {
        return;
      }

      ref.read(financeControllerProvider).loadTransactions();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(financeStateProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Finance')),
      body: _FinanceBody(state: state),
    );
  }
}

class _FinanceBody extends StatelessWidget {
  final FinanceState state;

  const _FinanceBody({required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) {
      return const _FinanceLoadingState();
    }

    if (state.hasError) {
      return _FinanceErrorState(
        message: state.errorMessage ?? 'Unable to load financial data.',
      );
    }

    if (state.isEmpty) {
      return const _FinanceEmptyState();
    }

    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        FinanceSummaryCard(transactions: state.transactions),
        const SizedBox(height: 24),
        const Text(
          'Transactions',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _FinanceTransactionList(state: state),
      ],
    );
  }
}

class _FinanceLoadingState extends StatelessWidget {
  const _FinanceLoadingState();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class _FinanceErrorState extends StatelessWidget {
  final String message;

  const _FinanceErrorState({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 48),
            const SizedBox(height: 16),
            Text(message, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class _FinanceEmptyState extends StatelessWidget {
  const _FinanceEmptyState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.account_balance_wallet_outlined, size: 48),
            SizedBox(height: 16),
            Text(
              'No financial transactions found.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _FinanceTransactionList extends StatelessWidget {
  final FinanceState state;

  const _FinanceTransactionList({required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final transaction in state.transactions) ...[
          Card(
            child: ListTile(
              leading: const Icon(Icons.receipt_long_outlined),
              title: Text(transaction.transactionCode),
              subtitle: Text(transaction.description),
              trailing: Text(
                '${transaction.amount.currency} '
                '${transaction.amount.amountMinor}',
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ],
    );
  }
}
