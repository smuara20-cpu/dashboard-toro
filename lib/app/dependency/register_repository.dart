import 'package:get_it/get_it.dart';

import '../../features/customer/data/datasource/customer_datasource.dart';
import '../../features/customer/data/mapper/customer_mapper.dart';
import '../../features/customer/data/repository/customer_repository_impl.dart';
import '../../features/customer/domain/repository/customer_repository.dart';
import '../../features/finance/data/datasource/finance_datasource.dart';
import '../../features/finance/data/mapper/transaction_mapper.dart';
import '../../features/finance/data/repository/finance_repository_impl.dart';
import '../../features/finance/domain/repository/finance_repository.dart';

final getIt = GetIt.instance;

void registerRepositories() {
  getIt.registerLazySingleton<CustomerRepository>(
    () => CustomerRepositoryImpl(
      dataSource: getIt<CustomerDataSource>(),
      mapper: getIt<CustomerMapper>(),
    ),
  );

  getIt.registerLazySingleton<FinanceRepository>(
    () => FinanceRepositoryImpl(
      dataSource: getIt<FinanceDataSource>(),
      mapper: getIt<TransactionMapper>(),
    ),
  );
}
