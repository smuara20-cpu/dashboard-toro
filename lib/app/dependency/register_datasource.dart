import 'package:get_it/get_it.dart';

import '../../features/customer/data/datasource/customer_datasource.dart';
import '../../features/customer/data/datasource/customer_local_datasource.dart';
import '../../features/finance/data/datasource/finance_datasource.dart';
import '../../features/finance/data/datasource/finance_local_datasource.dart';

final getIt = GetIt.instance;

void registerDatasource() {
  getIt.registerLazySingleton<CustomerDataSource>(
    () => CustomerLocalDataSource(),
  );

  getIt.registerLazySingleton<FinanceDataSource>(
    () => FinanceLocalDataSource(),
  );
}
