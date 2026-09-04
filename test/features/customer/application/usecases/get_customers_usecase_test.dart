import 'package:flutter_test/flutter_test.dart';
import 'package:dashboard_kpi/features/customer/data/datasource/customer_local_datasource.dart';
import 'package:dashboard_kpi/features/customer/data/mapper/customer_mapper.dart';
import 'package:dashboard_kpi/features/customer/data/repository/customer_repository_impl.dart';
import 'package:dashboard_kpi/features/customer/domain/repository/customer_repository.dart';
import 'package:dashboard_kpi/features/customer/application/usecases/get_customers_usecase.dart';

void main() {
  group('GetCustomersUseCase', () {
    late CustomerRepository repository;
    late GetCustomersUseCase useCase;

    setUp(() {
      repository = CustomerRepositoryImpl(
        dataSource: CustomerLocalDataSource(),
        mapper: const CustomerMapper(),
      );

      useCase = GetCustomersUseCase(repository: repository);
    });

    test('returns customer entities from repository', () async {
      final customers = await useCase();

      expect(customers, isNotEmpty);
      expect(customers.length, 1);
      expect(customers.first.id, 'customer-001');
      expect(customers.first.customerCode, 'CUS-0001');
      expect(customers.first.fullName, 'Ahmad Fauzan');
      expect(customers.first.isActive, isTrue);
    });
  });
}
