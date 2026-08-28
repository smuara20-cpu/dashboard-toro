import '../../domain/entities/customer_entity.dart';
import '../models/customer_model.dart';
import '../../../crm/domain/enums/lead_source.dart';

class CustomerMapper {
  const CustomerMapper();

  CustomerEntity toEntity(CustomerModel model) {
    return CustomerEntity(
      id: model.id,
      customerCode: model.customerCode,
      fullName: model.fullName,
      nickName: model.nickName,
      gender: model.gender,
      birthPlace: model.birthPlace,
      birthDate: model.birthDate,
      phoneNumber: model.phoneNumber,
      email: model.email,
      address: model.address,
      city: model.city,
      province: model.province,
      country: model.country,
      occupation: model.occupation,
      maritalStatus: model.maritalStatus,

      // String? → LeadSource?
      leadSource: _toLeadSource(model.leadSource),

      notes: model.notes,
      isActive: model.isActive,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      createdBy: model.createdBy,
      updatedBy: model.updatedBy,
    );
  }

  CustomerModel toModel(CustomerEntity entity) {
    return CustomerModel(
      id: entity.id,
      customerCode: entity.customerCode,
      fullName: entity.fullName,
      nickName: entity.nickName,
      gender: entity.gender,
      birthPlace: entity.birthPlace,
      birthDate: entity.birthDate,
      phoneNumber: entity.phoneNumber,
      email: entity.email,
      address: entity.address,
      city: entity.city,
      province: entity.province,
      country: entity.country,
      occupation: entity.occupation,
      maritalStatus: entity.maritalStatus,

      // LeadSource? → String?
      leadSource: _toLeadSourceString(entity.leadSource),

      notes: entity.notes,
      isActive: entity.isActive,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      createdBy: entity.createdBy,
      updatedBy: entity.updatedBy,
    );
  }

  LeadSource? _toLeadSource(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    for (final source in LeadSource.values) {
      if (source.name == value) {
        return source;
      }
    }

    return null;
  }

  String? _toLeadSourceString(LeadSource? value) {
    return value?.name;
  }
}