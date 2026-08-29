import 'package:get_it/get_it.dart';

import '../../features/customer/data/mapper/customer_mapper.dart';
import '../../features/finance/data/mapper/transaction_mapper.dart';

final getIt = GetIt.instance;

void registerMappers() {
  getIt.registerLazySingleton<CustomerMapper>(() => const CustomerMapper());

  getIt.registerLazySingleton<TransactionMapper>(() => TransactionMapper());
}
