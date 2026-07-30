import '../../domain/entities/customer_entity.dart';
import '../models/customer_model.dart';
import '../../../../core/base/base_mapper.dart';

class CustomerMapper
    extends BaseMapper<CustomerEntity, CustomerModel> {
  const CustomerMapper();

  @override
  CustomerEntity toEntity(CustomerModel model) {
    return CustomerEntity(
      id: model.id,
      fullName: model.fullName,
      phoneNumber: model.phoneNumber,
      email: model.email,
      birthDate: model.birthDate,
      city: model.city,
      province: model.province,
    );
  }

  @override
  CustomerModel toModel(CustomerEntity entity) {
    return CustomerModel(
      id: entity.id,
      fullName: entity.fullName,
      phoneNumber: entity.phoneNumber,
      email: entity.email,
      birthDate: entity.birthDate,
      city: entity.city,
      province: entity.province,
    );
  }
}