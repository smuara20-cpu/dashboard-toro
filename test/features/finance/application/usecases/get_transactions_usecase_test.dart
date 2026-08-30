import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/finance/application/usecases/get_transactions_usecase.dart';
import 'package:dashboard_kpi/features/finance/domain/entities/transaction_entity.dart';
import 'package:dashboard_kpi/features/finance/domain/enums/transaction_type.dart';
import 'package:dashboard_kpi/features/finance/domain/repository/finance_repository.dart';
import 'package:dashboard_kpi/features/finance/domain/value_objects/money.dart';

class FakeFinanceRepository implements FinanceRepository {
  final List<TransactionEntity> transactions;

  FakeFinanceRepository({this.transactions = const []});

  @override
  Future<List<TransactionEntity>> getTransactions() async {
    return transactions;
  }

  @override
  Future<TransactionEntity?> getTransactionById(String id) async {
    return null;
  }

  @override
  Future<void> saveTransaction(TransactionEntity transaction) async {}

  @override
  Future<void> updateTransaction(TransactionEntity transaction) async {}

  @override
  Future<void> deleteTransaction(String id) async {}
}

void main() {
  group('GetTransactionsUseCase', () {
    test('returns transactions from repository', () async {
      final transaction = TransactionEntity(
        id: 'trx-001',
        transactionCode: 'TRX-001',
        type: TransactionType.income,
        amount: Money(amountMinor: 1000000, currency: 'IDR'),
        description: 'Test income',
        transactionDate: DateTime(2026, 8, 31),
        createdAt: DateTime(2026, 8, 31),
        createdBy: 'tester',
      );

      final repository = FakeFinanceRepository(transactions: [transaction]);

      final useCase = GetTransactionsUseCase(repository: repository);

      final result = await useCase();

      expect(result, hasLength(1));
      expect(result.first.id, 'trx-001');
      expect(result.first.transactionCode, 'TRX-001');
    });

    test('returns empty list when repository is empty', () async {
      final repository = FakeFinanceRepository();

      final useCase = GetTransactionsUseCase(repository: repository);

      final result = await useCase();

      expect(result, isEmpty);
    });
  });
}
