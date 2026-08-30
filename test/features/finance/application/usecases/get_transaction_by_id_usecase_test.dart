import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/finance/application/usecases/get_transaction_by_id_usecase.dart';
import 'package:dashboard_kpi/features/finance/domain/entities/transaction_entity.dart';
import 'package:dashboard_kpi/features/finance/domain/enums/transaction_type.dart';
import 'package:dashboard_kpi/features/finance/domain/repository/finance_repository.dart';
import 'package:dashboard_kpi/features/finance/domain/value_objects/money.dart';

class FakeFinanceRepository implements FinanceRepository {
  final TransactionEntity? transaction;

  FakeFinanceRepository({this.transaction});

  @override
  Future<List<TransactionEntity>> getTransactions() async {
    return transaction == null ? [] : [transaction!];
  }

  @override
  Future<TransactionEntity?> getTransactionById(String id) async {
    if (transaction?.id == id) {
      return transaction;
    }

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
  group('GetTransactionByIdUseCase', () {
    test('returns transaction when transaction exists', () async {
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

      final repository = FakeFinanceRepository(transaction: transaction);

      final useCase = GetTransactionByIdUseCase(repository: repository);

      final result = await useCase('trx-001');

      expect(result, isNotNull);
      expect(result!.id, 'trx-001');
      expect(result.transactionCode, 'TRX-001');
    });

    test('returns null when transaction does not exist', () async {
      final repository = FakeFinanceRepository();

      final useCase = GetTransactionByIdUseCase(repository: repository);

      final result = await useCase('trx-not-found');

      expect(result, isNull);
    });
  });
}
