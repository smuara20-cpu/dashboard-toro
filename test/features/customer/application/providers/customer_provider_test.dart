import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/customer/application/providers/customer_provider.dart';
import 'package:dashboard_kpi/features/customer/application/usecases/get_customers_usecase.dart';

void main() {
  group('Customer Provider', () {
    test('resolves GetCustomersUseCase', () {
      final container = ProviderContainer();

      addTearDown(container.dispose);

      final useCase = container.read(getCustomersUseCaseProvider);

      expect(useCase, isA<GetCustomersUseCase>());
    });

    test('GetCustomersUseCase returns seeded customer', () async {
      final container = ProviderContainer();

      addTearDown(container.dispose);

      final useCase = container.read(getCustomersUseCaseProvider);

      final customers = await useCase();

      expect(customers, isNotEmpty);
      expect(customers.length, 1);
      expect(customers.first.id, 'customer-001');
      expect(customers.first.customerCode, 'CUS-0001');
      expect(customers.first.fullName, 'Ahmad Fauzan');
    });
  });
}
