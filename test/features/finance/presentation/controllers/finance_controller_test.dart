import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/finance/application/usecases/delete_transaction_usecase.dart';
import 'package:dashboard_kpi/features/finance/application/usecases/get_transaction_by_id_usecase.dart';
import 'package:dashboard_kpi/features/finance/application/usecases/get_transactions_usecase.dart';
import 'package:dashboard_kpi/features/finance/application/usecases/save_transaction_usecase.dart';
import 'package:dashboard_kpi/features/finance/application/usecases/update_transaction_usecase.dart';
import 'package:dashboard_kpi/features/finance/domain/entities/transaction_entity.dart';
import 'package:dashboard_kpi/features/finance/domain/enums/transaction_type.dart';
import 'package:dashboard_kpi/features/finance/domain/repository/finance_repository.dart';
import 'package:dashboard_kpi/features/finance/domain/value_objects/money.dart';
import 'package:dashboard_kpi/features/finance/presentation/controllers/finance_controller.dart';
import 'package:dashboard_kpi/features/finance/presentation/state/finance_state.dart';

class FakeFinanceRepository implements FinanceRepository {
  List<TransactionEntity> transactions = [];
  Object? getTransactionsError;

  @override
  Future<List<TransactionEntity>> getTransactions() async {
    if (getTransactionsError != null) {
      throw getTransactionsError!;
    }

    return List.unmodifiable(transactions);
  }

  @override
  Future<TransactionEntity?> getTransactionById(String id) async {
    return transactions
        .where((transaction) => transaction.id == id)
        .firstOrNull;
  }

  @override
  Future<void> saveTransaction(TransactionEntity transaction) async {
    transactions = [...transactions, transaction];
  }

  @override
  Future<void> updateTransaction(TransactionEntity transaction) async {
    transactions = transactions
        .map((item) => item.id == transaction.id ? transaction : item)
        .toList();
  }

  @override
  Future<void> deleteTransaction(String id) async {
    transactions = transactions
        .where((transaction) => transaction.id != id)
        .toList();
  }
}

TransactionEntity createTransaction({String id = 'trx-001'}) {
  return TransactionEntity(
    id: id,
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

FinanceController createController(FakeFinanceRepository repository) {
  return FinanceController(
    getTransactionsUseCase: GetTransactionsUseCase(repository: repository),
    getTransactionByIdUseCase: GetTransactionByIdUseCase(
      repository: repository,
    ),
    saveTransactionUseCase: SaveTransactionUseCase(repository: repository),
    updateTransactionUseCase: UpdateTransactionUseCase(repository: repository),
    deleteTransactionUseCase: DeleteTransactionUseCase(repository: repository),
  );
}

void main() {
  group('FinanceController', () {
    group('loadTransactions', () {
      test('sets loading then success when transactions exist', () async {
        final repository = FakeFinanceRepository()
          ..transactions = [createTransaction()];

        final controller = createController(repository);

        expect(controller.state.status, FinanceStatus.initial);

        final future = controller.loadTransactions();

        expect(controller.state.status, FinanceStatus.loading);

        await future;

        expect(controller.state.status, FinanceStatus.success);
        expect(controller.state.transactions, hasLength(1));
        expect(controller.state.transactions.first.id, 'trx-001');
        expect(controller.state.errorMessage, isNull);
      });

      test('sets empty when repository returns no transactions', () async {
        final repository = FakeFinanceRepository();
        final controller = createController(repository);

        await controller.loadTransactions();

        expect(controller.state.status, FinanceStatus.empty);
        expect(controller.state.transactions, isEmpty);
        expect(controller.state.errorMessage, isNull);
      });

      test('sets failure when repository throws', () async {
        final repository = FakeFinanceRepository()
          ..getTransactionsError = Exception('Unable to load transactions');

        final controller = createController(repository);

        await controller.loadTransactions();

        expect(controller.state.status, FinanceStatus.failure);
        expect(controller.state.hasError, isTrue);
        expect(
          controller.state.errorMessage,
          contains('Unable to load transactions'),
        );
      });
    });

    group('getTransactionById', () {
      test('returns transaction when transaction exists', () async {
        final repository = FakeFinanceRepository()
          ..transactions = [createTransaction()];

        final controller = createController(repository);

        final result = await controller.getTransactionById('trx-001');

        expect(result, isNotNull);
        expect(result!.id, 'trx-001');
        expect(result.transactionCode, 'TRX-001');
      });

      test('returns null when transaction does not exist', () async {
        final repository = FakeFinanceRepository();
        final controller = createController(repository);

        final result = await controller.getTransactionById('trx-404');

        expect(result, isNull);
      });
    });

    group('saveTransaction', () {
      test('saves transaction and reloads state', () async {
        final repository = FakeFinanceRepository();
        final controller = createController(repository);

        final transaction = createTransaction();

        await controller.saveTransaction(transaction);

        expect(repository.transactions, hasLength(1));
        expect(repository.transactions.first.id, 'trx-001');
        expect(controller.state.status, FinanceStatus.success);
        expect(controller.state.transactions, hasLength(1));
      });
    });

    group('updateTransaction', () {
      test('updates transaction and reloads state', () async {
        final original = createTransaction();

        final repository = FakeFinanceRepository()..transactions = [original];

        final controller = createController(repository);

        final updated = TransactionEntity(
          id: original.id,
          transactionCode: original.transactionCode,
          type: original.type,
          amount: const Money(amountMinor: 2000000, currency: 'IDR'),
          description: 'Updated Payment Umrah',
          transactionDate: original.transactionDate,
          referenceId: original.referenceId,
          referenceType: original.referenceType,
          branchId: original.branchId,
          customerId: original.customerId,
          packageId: original.packageId,
          notes: 'Updated transaction',
          createdAt: original.createdAt,
          createdBy: original.createdBy,
        );

        await controller.updateTransaction(updated);

        expect(repository.transactions, hasLength(1));
        expect(repository.transactions.first.amount.amountMinor, 2000000);
        expect(
          repository.transactions.first.description,
          'Updated Payment Umrah',
        );
        expect(controller.state.status, FinanceStatus.success);
        expect(controller.state.transactions.first.amount.amountMinor, 2000000);
      });
    });

    group('deleteTransaction', () {
      test('deletes transaction and reloads empty state', () async {
        final repository = FakeFinanceRepository()
          ..transactions = [createTransaction()];

        final controller = createController(repository);

        await controller.deleteTransaction('trx-001');

        expect(repository.transactions, isEmpty);
        expect(controller.state.status, FinanceStatus.empty);
        expect(controller.state.transactions, isEmpty);
      });
    });
  });
}
