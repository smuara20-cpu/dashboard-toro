import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/finance/application/usecases/delete_transaction_usecase.dart';
import 'package:dashboard_kpi/features/finance/domain/entities/transaction_entity.dart';
import 'package:dashboard_kpi/features/finance/domain/repository/finance_repository.dart';

class FakeFinanceRepository implements FinanceRepository {
  String? deletedTransactionId;

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
  Future<void> saveTransaction(TransactionEntity transaction) async {}

  @override
  Future<void> updateTransaction(TransactionEntity transaction) async {}

  @override
  Future<void> deleteTransaction(String id) async {
    if (errorToThrow != null) {
      throw errorToThrow!;
    }

    deletedTransactionId = id;
  }
}

void main() {
  group('DeleteTransactionUseCase', () {
    test('deletes transaction through repository', () async {
      final repository = FakeFinanceRepository();
      final useCase = DeleteTransactionUseCase(repository: repository);

      const transactionId = 'trx-001';

      await useCase(transactionId);

      expect(repository.deletedTransactionId, transactionId);
    });

    test('propagates repository exception', () async {
      final repository = FakeFinanceRepository()
        ..errorToThrow = Exception('Delete transaction failed');

      final useCase = DeleteTransactionUseCase(repository: repository);

      expect(
        () => useCase('trx-001'),
        throwsA(
          isA<Exception>().having(
            (error) => error.toString(),
            'message',
            contains('Delete transaction failed'),
          ),
        ),
      );
    });
  });
}
