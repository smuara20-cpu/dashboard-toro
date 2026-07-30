import 'customer_datasource.dart';
import '../models/customer_model.dart';

class CustomerLocalDataSource implements CustomerDataSource {
  final List<CustomerModel> _customers = [
    CustomerModel(
      id: 'CUS001',
      fullName: 'Ahmad Fauzi',
      phoneNumber: '081234567890',
      email: 'ahmad@example.com',
      city: 'Jakarta',
      province: 'DKI Jakarta',
    ),
    CustomerModel(
      id: 'CUS002',
      fullName: 'Siti Aminah',
      phoneNumber: '081298765432',
      email: 'siti@example.com',
      city: 'Bandung',
      province: 'Jawa Barat',
    ),
  ];

  @override
  Future<List<CustomerModel>> getCustomers() async {
    return List.unmodifiable(_customers);
  }

  @override
  Future<CustomerModel?> getCustomerById(String id) async {
    try {
      return _customers.firstWhere((e) => e.id == id);
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
    final index = _customers.indexWhere((e) => e.id == customer.id);
    if (index != -1) {
      _customers[index] = customer;
    }
  }

  @override
  Future<void> deleteCustomer(String id) async {
    _customers.removeWhere((e) => e.id == id);
  }
}