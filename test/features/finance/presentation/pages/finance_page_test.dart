import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/app/dependency/injector.dart';
import 'package:dashboard_kpi/features/finance/domain/entities/transaction_entity.dart';
import 'package:dashboard_kpi/features/finance/domain/enums/transaction_type.dart';
import 'package:dashboard_kpi/features/finance/domain/value_objects/money.dart';
import 'package:dashboard_kpi/features/finance/presentation/pages/finance_page.dart';
import 'package:dashboard_kpi/features/finance/presentation/providers/finance_provider.dart';
import 'package:dashboard_kpi/features/finance/presentation/state/finance_state.dart';

void main() {
  setUpAll(() async {
    await initializeInjector();
  });

  Widget buildTestWidget({required FinanceState state}) {
    return ProviderScope(
      overrides: [financeStateProvider.overrideWithValue(state)],
      child: const MaterialApp(home: FinancePage()),
    );
  }

  group('FinancePage', () {
    testWidgets('shows loading state', (tester) async {
      const state = FinanceState(status: FinanceStatus.loading);

      await tester.pumpWidget(buildTestWidget(state: state));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows error state', (tester) async {
      const state = FinanceState(
        status: FinanceStatus.failure,
        errorMessage: 'Failed to load transactions.',
      );

      await tester.pumpWidget(buildTestWidget(state: state));

      expect(find.text('Failed to load transactions.'), findsOneWidget);

      expect(find.byIcon(Icons.error_outline), findsOneWidget);
    });

    testWidgets('shows empty state', (tester) async {
      const state = FinanceState(status: FinanceStatus.empty);

      await tester.pumpWidget(buildTestWidget(state: state));

      expect(find.text('No financial transactions found.'), findsOneWidget);

      expect(
        find.byIcon(Icons.account_balance_wallet_outlined),
        findsOneWidget,
      );
    });

    testWidgets('shows finance summary and transactions', (tester) async {
      final transactions = [
        TransactionEntity(
          id: 'trx-001',
          transactionCode: 'TRX-001',
          type: TransactionType.income,
          amount: Money(amountMinor: 1000000, currency: 'IDR'),
          description: 'Umroh payment',
          transactionDate: DateTime(2026, 9, 1),
          createdAt: DateTime(2026, 9, 1, 10),
          createdBy: 'test-user',
        ),
        TransactionEntity(
          id: 'trx-002',
          transactionCode: 'TRX-002',
          type: TransactionType.expense,
          amount: Money(amountMinor: 250000, currency: 'IDR'),
          description: 'Hotel payment',
          transactionDate: DateTime(2026, 9, 1),
          createdAt: DateTime(2026, 9, 1, 11),
          createdBy: 'test-user',
        ),
      ];

      final state = FinanceState(
        status: FinanceStatus.success,
        transactions: transactions,
      );

      await tester.pumpWidget(buildTestWidget(state: state));

      expect(find.text('Finance Summary'), findsOneWidget);

      expect(find.text('Transactions'), findsOneWidget);

      expect(find.text('TRX-001'), findsOneWidget);

      expect(find.text('TRX-002'), findsOneWidget);

      expect(find.text('Umroh payment'), findsOneWidget);

      expect(find.text('Hotel payment'), findsOneWidget);
    });
  });
}
