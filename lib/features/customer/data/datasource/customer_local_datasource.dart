import '../models/customer_model.dart';
import 'customer_datasource.dart';

class CustomerLocalDataSource implements CustomerDataSource {
  final List<CustomerModel> _customers = [];

  @override
  Future<List<CustomerModel>> getCustomers() async {
    return List.unmodifiable(_customers);
  }

  @override
  Future<CustomerModel?> getCustomerById(String id) async {
    try {
      return _customers.firstWhere(
            (customer) => customer.id == id,
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> saveCustomer(CustomerModel customer) async {
    _customers.add(customer);
  }

  @override
  Future<void> updateCustomer(CustomerModel customer) async {
    final index = _customers.indexWhere(
          (item) => item.id == customer.id,
    );

    if (index == -1) {
      return;
    }

    _customers[index] = customer;
  }

  @override
  Future<void> deleteCustomer(String id) async {
    _customers.removeWhere(
          (customer) => customer.id == id,
    );
  }
}