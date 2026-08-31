import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dashboard_kpi/app/dependency/service_locator.dart';
import 'package:dashboard_kpi/features/finance/application/usecases/delete_transaction_usecase.dart';
import 'package:dashboard_kpi/features/finance/application/usecases/get_transaction_by_id_usecase.dart';
import 'package:dashboard_kpi/features/finance/application/usecases/get_transactions_usecase.dart';
import 'package:dashboard_kpi/features/finance/application/usecases/save_transaction_usecase.dart';
import 'package:dashboard_kpi/features/finance/application/usecases/update_transaction_usecase.dart';
import 'package:dashboard_kpi/features/finance/data/datasource/finance_datasource.dart';
import 'package:dashboard_kpi/features/finance/data/datasource/finance_local_datasource.dart';
import 'package:dashboard_kpi/features/finance/data/mapper/transaction_mapper.dart';
import 'package:dashboard_kpi/features/finance/data/repository/finance_repository_impl.dart';
import 'package:dashboard_kpi/features/finance/domain/repository/finance_repository.dart';
import 'package:dashboard_kpi/features/finance/presentation/controllers/finance_controller.dart';
import 'package:dashboard_kpi/features/finance/presentation/providers/finance_provider.dart';

void main() {
  setUp(() async {
    await sl.reset();

    sl.registerLazySingleton<FinanceDataSource>(() => FinanceLocalDataSource());

    sl.registerLazySingleton<TransactionMapper>(TransactionMapper.new);

    sl.registerLazySingleton<FinanceRepository>(
      () => FinanceRepositoryImpl(
        dataSource: sl<FinanceDataSource>(),
        mapper: sl<TransactionMapper>(),
      ),
    );

    sl.registerLazySingleton<GetTransactionsUseCase>(
      () => GetTransactionsUseCase(repository: sl<FinanceRepository>()),
    );

    sl.registerLazySingleton<GetTransactionByIdUseCase>(
      () => GetTransactionByIdUseCase(repository: sl<FinanceRepository>()),
    );

    sl.registerLazySingleton<SaveTransactionUseCase>(
      () => SaveTransactionUseCase(repository: sl<FinanceRepository>()),
    );

    sl.registerLazySingleton<UpdateTransactionUseCase>(
      () => UpdateTransactionUseCase(repository: sl<FinanceRepository>()),
    );

    sl.registerLazySingleton<DeleteTransactionUseCase>(
      () => DeleteTransactionUseCase(repository: sl<FinanceRepository>()),
    );

    sl.registerFactory<FinanceController>(
      () => FinanceController(
        getTransactionsUseCase: sl<GetTransactionsUseCase>(),
        getTransactionByIdUseCase: sl<GetTransactionByIdUseCase>(),
        saveTransactionUseCase: sl<SaveTransactionUseCase>(),
        updateTransactionUseCase: sl<UpdateTransactionUseCase>(),
        deleteTransactionUseCase: sl<DeleteTransactionUseCase>(),
      ),
    );
  });

  tearDown(() async {
    await sl.reset();
  });

  test('financeControllerProvider resolves FinanceController', () {
    final container = ProviderContainer();

    addTearDown(container.dispose);

    final controller = container.read(financeControllerProvider);

    expect(controller, isA<FinanceController>());
  });

  test('financeStateProvider exposes controller state', () {
    final container = ProviderContainer();

    addTearDown(container.dispose);

    final state = container.read(financeStateProvider);

    expect(state.status.name, 'initial');
    expect(state.transactions, isEmpty);
    expect(state.errorMessage, isNull);
  });
}
