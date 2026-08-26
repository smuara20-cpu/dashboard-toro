class CustomerModel {
  final String id;
  final String customerCode;
  final String fullName;
  final String? nickName;
  final String gender;
  final String? birthPlace;
  final DateTime? birthDate;
  final String phoneNumber;
  final String? email;
  final String? address;
  final String? city;
  final String? province;
  final String country;
  final String? occupation;
  final String? maritalStatus;
  final String? leadSource;
  final String? notes;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdBy;
  final String? updatedBy;

  const CustomerModel({
    required this.id,
    required this.customerCode,
    required this.fullName,
    this.nickName,
    required this.gender,
    this.birthPlace,
    this.birthDate,
    required this.phoneNumber,
    this.email,
    this.address,
    this.city,
    this.province,
    required this.country,
    this.occupation,
    this.maritalStatus,
    this.leadSource,
    this.notes,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    this.updatedBy,
  });

  factory CustomerModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return CustomerModel(
      id: json['id'] as String,
      customerCode: json['customerCode'] as String,
      fullName: json['fullName'] as String,
      nickName: json['nickName'] as String?,
      gender: json['gender'] as String,
      birthPlace: json['birthPlace'] as String?,
      birthDate: json['birthDate'] != null
          ? DateTime.parse(
        json['birthDate'] as String,
      )
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customerCode': customerCode,
      'fullName': fullName,
      'nickName': nickName,
      'gender': gender,
      'birthPlace': birthPlace,
      'birthDate': birthDate?.toIso8601String(),
      'phoneNumber': phoneNumber,
      'email': email,
      'address': address,
      'city': city,
      'province': province,
      'country': country,
      'occupation': occupation,
      'maritalStatus': maritalStatus,
      'leadSource': leadSource,
      'notes': notes,
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'createdBy': createdBy,
      'updatedBy': updatedBy,
    };
  }
}