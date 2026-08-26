import 'package:get_it/get_it.dart';

import '../../features/customer/domain/repository/customer_repository.dart';
import '../../features/customer/data/repository/customer_repository_impl.dart';
import '../../features/customer/data/datasource/customer_datasource.dart';
import '../../features/customer/data/mapper/customer_mapper.dart';

final getIt = GetIt.instance;

void registerRepositories() {
  getIt.registerLazySingleton<CustomerRepository>(
        () => CustomerRepositoryImpl(
      dataSource: getIt<CustomerDataSource>(),
      mapper: getIt<CustomerMapper>(),
    ),
  );
}