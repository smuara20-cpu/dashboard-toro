import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/customer/application/usecases/get_active_customers_usecase.dart';
import 'package:dashboard_kpi/features/customer/data/datasource/customer_local_datasource.dart';
import 'package:dashboard_kpi/features/customer/data/mapper/customer_mapper.dart';
import 'package:dashboard_kpi/features/customer/data/repository/customer_repository_impl.dart';
import 'package:dashboard_kpi/features/customer/domain/repository/customer_repository.dart';

void main() {
  group('GetActiveCustomersUseCase', () {
    late CustomerRepository repository;
    late GetActiveCustomersUseCase useCase;

    setUp(() {
      repository = CustomerRepositoryImpl(
        dataSource: CustomerLocalDataSource(),
        mapper: const CustomerMapper(),
      );

      useCase = GetActiveCustomersUseCase(repository: repository);
    });

    test('returns only active customers', () async {
      final customers = await useCase();

      expect(customers, isNotEmpty);
      expect(customers.every((customer) => customer.isActive), isTrue);
    });

    test('returns seeded active customer', () async {
      final customers = await useCase();

      expect(customers.length, 1);
      expect(customers.first.id, 'customer-001');
      expect(customers.first.customerCode, 'CUS-0001');
      expect(customers.first.fullName, 'Ahmad Fauzan');
    });
  });
}
