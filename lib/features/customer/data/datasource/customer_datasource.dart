import '../models/customer_model.dart';

abstract interface class CustomerDataSource {
  Future<List<CustomerModel>> getCustomers();

  Future<CustomerModel?> getCustomerById(String id);

  Future<void> saveCustomer(CustomerModel customer);

  Future<void> updateCustomer(CustomerModel customer);

  Future<void> deleteCustomer(String id);
}