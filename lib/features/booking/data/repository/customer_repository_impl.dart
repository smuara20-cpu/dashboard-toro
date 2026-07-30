import '../../domain/entities/customer_entity.dart';
import '../../domain/repository/customer_repository.dart';

import '../datasource/customer_datasource.dart';
import '../mapper/customer_mapper.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerDataSource dataSource;
  final CustomerMapper mapper;

  const CustomerRepositoryImpl({
    required this.dataSource,
    required this.mapper,
  });

  @override
  Future<List<CustomerEntity>> getCustomers() async {
    final models = await dataSource.getCustomers();

    return models.map(mapper.toEntity).toList();
  }

  @override
  Future<CustomerEntity?> getCustomerById(String id) async {
    final model = await dataSource.getCustomerById(id);

    if (model == null) return null;

    return mapper.toEntity(model);
  }

  @override
  Future<void> saveCustomer(CustomerEntity customer) async {
    await dataSource.saveCustomer(
      mapper.toModel(customer),
    );
  }

  @override
  Future<void> updateCustomer(CustomerEntity customer) async {
    await dataSource.updateCustomer(
      mapper.toModel(customer),
    );
  }

  @override
  Future<void> deleteCustomer(String id) async {
    await dataSource.deleteCustomer(id);
  }
}