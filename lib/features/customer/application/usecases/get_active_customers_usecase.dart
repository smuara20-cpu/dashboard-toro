import '../../domain/entities/customer_entity.dart';
import '../../domain/repository/customer_repository.dart';

class GetActiveCustomersUseCase {
  final CustomerRepository repository;

  const GetActiveCustomersUseCase({required this.repository});

  Future<List<CustomerEntity>> call() async {
    final customers = await repository.getCustomers();

    return customers.where((customer) => customer.isActive).toList();
  }
}
