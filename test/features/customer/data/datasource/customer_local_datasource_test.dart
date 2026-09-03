import 'package:flutter_test/flutter_test.dart';
import 'package:dashboard_kpi/features/customer/data/datasource/customer_local_datasource.dart';

void main() {
  group('CustomerLocalDataSource', () {
    late CustomerLocalDataSource dataSource;

    setUp(() {
      dataSource = CustomerLocalDataSource();
    });

    test('returns seeded active customer', () async {
      final customers = await dataSource.getCustomers();

      expect(customers, isNotEmpty);
      expect(customers.length, 1);
      expect(customers.first.id, 'customer-001');
      expect(customers.first.customerCode, 'CUS-0001');
      expect(customers.first.fullName, 'Ahmad Fauzan');
      expect(customers.first.isActive, isTrue);
    });

    test('returns customer by id', () async {
      final customer = await dataSource.getCustomerById('customer-001');

      expect(customer, isNotNull);
      expect(customer!.customerCode, 'CUS-0001');
      expect(customer.fullName, 'Ahmad Fauzan');
    });

    test('returns null when customer id does not exist', () async {
      final customer = await dataSource.getCustomerById('customer-not-found');

      expect(customer, isNull);
    });
  });
}
