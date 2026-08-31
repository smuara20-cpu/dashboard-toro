import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/finance/application/usecases/save_transaction_usecase.dart';
import 'package:dashboard_kpi/features/finance/domain/entities/transaction_entity.dart';
import 'package:dashboard_kpi/features/finance/domain/enums/transaction_type.dart';
import 'package:dashboard_kpi/features/finance/domain/repository/finance_repository.dart';
import 'package:dashboard_kpi/features/finance/domain/value_objects/money.dart';

class FakeFinanceRepository implements FinanceRepository {
  TransactionEntity? savedTransaction;

  Object? errorToThrow;

  @override
  Future<List<TransactionEntity>> getTransactions() async {
    return [];
  }

  @override
  Future<TransactionEntity?> getTransactionById(String id) async {
    return null;
  }

  @override
  Future<void> saveTransaction(TransactionEntity transaction) async {
    if (errorToThrow != null) {
      throw errorToThrow!;
    }

    savedTransaction = transaction;
  }

  @override
  Future<void> updateTransaction(TransactionEntity transaction) async {}

  @override
  Future<void> deleteTransaction(String id) async {}
}

TransactionEntity createTransaction() {
  return TransactionEntity(
    id: 'trx-001',
    transactionCode: 'TRX-001',
    type: TransactionType.income,
    amount: const Money(amountMinor: 1500000, currency: 'IDR'),
    description: 'Payment Umrah',
    transactionDate: DateTime(2026, 8, 31),
    referenceId: 'booking-001',
    referenceType: 'booking',
    branchId: 'branch-001',
    customerId: 'customer-001',
    packageId: 'package-001',
    notes: 'Test transaction',
    createdAt: DateTime(2026, 8, 31),
    createdBy: 'user-001',
  );
}

void main() {
  group('SaveTransactionUseCase', () {
    test('saves transaction through repository', () async {
      final repository = FakeFinanceRepository();
      final useCase = SaveTransactionUseCase(repository: repository);

      final transaction = createTransaction();

      await useCase(transaction);

      expect(repository.savedTransaction, same(transaction));
    });

    test('propagates repository exception', () async {
      final repository = FakeFinanceRepository()
        ..errorToThrow = Exception('Save transaction failed');

      final useCase = SaveTransactionUseCase(repository: repository);

      final transaction = createTransaction();

      expect(
        () => useCase(transaction),
        throwsA(
          isA<Exception>().having(
            (error) => error.toString(),
            'message',
            contains('Save transaction failed'),
          ),
        ),
      );
    });
  });
}
