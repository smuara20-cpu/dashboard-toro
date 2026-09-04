import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard_kpi/features/customer/application/providers/customer_provider.dart';
import 'package:dashboard_kpi/features/customer/application/usecases/get_active_customers_usecase.dart';

void main() {
  group('GetActiveCustomersUseCase Provider', () {
    test('resolves active customer use case', () {
      final container = ProviderContainer();

      addTearDown(container.dispose);

      final useCase = container.read(
        getActiveCustomersUseCaseProvider,
      );

      expect(
        useCase,
        isA<GetActiveCustomersUseCase>(),
      );
    });

    test('returns active customers from provider wiring', () async {
      final container = ProviderContainer();

      addTearDown(container.dispose);

      final useCase = container.read(
        getActiveCustomersUseCaseProvider,
      );

      final customers = await useCase();

      expect(customers, isNotEmpty);
      expect(customers.every((customer) => customer.isActive), isTrue);
      expect(customers.first.id, 'customer-001');
      expect(customers.first.customerCode, 'CUS-0001');
    });
  });
}
