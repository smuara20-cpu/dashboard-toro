class CustomerEntity {
  final String id;

  final String customerCode;

  /// Nama lengkap customer.
  final String fullName;

  /// Nama panggilan customer.
  final String? nickName;

  /// Jenis kelamin.
  final String gender;

  /// Tempat lahir.
  final String? birthPlace;

  /// Tanggal lahir.
  final DateTime? birthDate;

  /// Nomor HP.
  final String phoneNumber;

  /// Email.
  final String? email;

  /// Alamat lengkap.
  final String? address;

  /// Kota.
  final String? city;

  /// Provinsi.
  final String? province;

  /// Negara.
  final String country;

  /// Pekerjaan.
  final String? occupation;

  /// Status pernikahan.
  final String? maritalStatus;

  /// Sumber lead/customer.
  final String? leadSource;

  /// Catatan customer.
  final String? notes;

  /// Status aktif customer.
  final bool isActive;

  final DateTime createdAt;

  final DateTime updatedAt;

  final String createdBy;

  final String? updatedBy;

  const CustomerEntity({
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
}