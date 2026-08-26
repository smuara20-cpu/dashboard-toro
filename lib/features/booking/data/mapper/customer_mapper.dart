import '../../../customer/domain/entities/customer_entity.dart';

class CustomerMapper {
  const CustomerMapper();

  CustomerEntity fromJson(Map<String, dynamic> json) {
    return CustomerEntity(
      id: json['id'] as String,
      customerCode: json['customerCode'] as String,
      fullName: json['fullName'] as String,
      nickName: json['nickName'] as String?,
      gender: json['gender'] as String,
      birthPlace: json['birthPlace'] as String?,
      birthDate: json['birthDate'] != null
          ? DateTime.parse(json['birthDate'] as String)
          : null,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      province: json['province'] as String?,
      country: json['country'] as String,
      occupation: json['occupation'] as String?,
      maritalStatus: json['maritalStatus'] as String?,
      leadSource: json['leadSource'] as String?,
      notes: json['notes'] as String?,
      isActive: json['isActive'] as bool,
      createdAt: DateTime.parse(
        json['createdAt'] as String,
      ),
      updatedAt: DateTime.parse(
        json['updatedAt'] as String,
      ),
      createdBy: json['createdBy'] as String,
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson(CustomerEntity entity) {
    return {
      'id': entity.id,
      'customerCode': entity.customerCode,
      'fullName': entity.fullName,
      'nickName': entity.nickName,
      'gender': entity.gender,
      'birthPlace': entity.birthPlace,
      'birthDate': entity.birthDate?.toIso8601String(),
      'phoneNumber': entity.phoneNumber,
      'email': entity.email,
      'address': entity.address,
      'city': entity.city,
      'province': entity.province,
      'country': entity.country,
      'occupation': entity.occupation,
      'maritalStatus': entity.maritalStatus,
      'leadSource': entity.leadSource,
      'notes': entity.notes,
      'isActive': entity.isActive,
      'createdAt': entity.createdAt.toIso8601String(),
      'updatedAt': entity.updatedAt.toIso8601String(),
      'createdBy': entity.createdBy,
      'updatedBy': entity.updatedBy,
    };
  }
}