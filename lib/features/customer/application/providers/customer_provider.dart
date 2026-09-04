import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasource/customer_local_datasource.dart';
import '../../data/mapper/customer_mapper.dart';
import '../../data/repository/customer_repository_impl.dart';
import '../../domain/repository/customer_repository.dart';
import '../usecases/get_active_customers_usecase.dart';
import '../usecases/get_customers_usecase.dart';

final customerDataSourceProvider = Provider<CustomerLocalDataSource>((ref) {
  return CustomerLocalDataSource();
});

final customerMapperProvider = Provider<CustomerMapper>((ref) {
  return const CustomerMapper();
});

final customerRepositoryProvider = Provider<CustomerRepository>((ref) {
  return CustomerRepositoryImpl(
    dataSource: ref.read(customerDataSourceProvider),
    mapper: ref.read(customerMapperProvider),
  );
});

final getCustomersUseCaseProvider = Provider<GetCustomersUseCase>((ref) {
  return GetCustomersUseCase(repository: ref.read(customerRepositoryProvider));
});

final getActiveCustomersUseCaseProvider = Provider<GetActiveCustomersUseCase>((
  ref,
) {
  return GetActiveCustomersUseCase(
    repository: ref.read(customerRepositoryProvider),
  );
});
