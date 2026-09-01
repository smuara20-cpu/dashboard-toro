import 'package:flutter/material.dart';

import 'package:dashboard_kpi/features/finance/domain/entities/transaction_entity.dart';
import 'package:dashboard_kpi/features/finance/domain/enums/transaction_type.dart';
import 'package:dashboard_kpi/features/finance/domain/value_objects/money.dart';

class FinanceSummaryCard extends StatelessWidget {
  final List<TransactionEntity> transactions;

  const FinanceSummaryCard({super.key, required this.transactions});

  Money _calculateTotal(TransactionType type, String currency) {
    var total = Money.zero(currency: currency);

    for (final transaction in transactions) {
      if (transaction.type != type) {
        continue;
      }

      if (transaction.amount.currency != currency) {
        continue;
      }

      total += transaction.amount;
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    final currency = transactions.isEmpty
        ? 'IDR'
        : transactions.first.amount.currency;

    final income = _calculateTotal(TransactionType.income, currency);

    final expense = _calculateTotal(TransactionType.expense, currency);

    final balance = income - expense;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Finance Summary',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            _SummaryItem(label: 'Total Income', money: income),
            const SizedBox(height: 12),
            _SummaryItem(label: 'Total Expense', money: expense),
            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 12),
            _SummaryItem(
              label: 'Net Balance',
              money: balance,
              emphasized: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final String label;
  final Money money;
  final bool emphasized;

  const _SummaryItem({
    required this.label,
    required this.money,
    this.emphasized = false,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = emphasized
        ? Theme.of(context).textTheme.titleMedium
        : Theme.of(context).textTheme.bodyLarge;

    return Row(
      children: [
        Expanded(child: Text(label, style: textStyle)),
        Text(
          '${money.currency} ${money.amountMinor}',
          style: textStyle?.copyWith(
            fontWeight: emphasized ? FontWeight.bold : null,
          ),
        ),
      ],
    );
  }
}
