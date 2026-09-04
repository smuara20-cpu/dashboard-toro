import '../../domain/entities/customer_entity.dart';
import '../../domain/repository/customer_repository.dart';

class GetCustomersUseCase {
  final CustomerRepository repository;

  const GetCustomersUseCase({required this.repository});

  Future<List<CustomerEntity>> call() {
    return repository.getCustomers();
  }
}
