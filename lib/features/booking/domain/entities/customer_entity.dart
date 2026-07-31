class CustomerEntity {
  /// Primary Key
  final String id;

  /// Nomor Customer
  final String customerCode;

  /// Nama Lengkap
  final String fullName;

  /// Nama Panggilan
  final String? nickName;

  /// Jenis Kelamin
  final String gender;

  /// Tempat Lahir
  final String? birthPlace;

  /// Tanggal Lahir
  final DateTime? birthDate;

  /// Nomor HP
  final String phoneNumber;

  /// Email
  final String? email;

  /// Alamat
  final String? address;

  /// Kota
  final String? city;

  /// Provinsi
  final String? province;

  /// Negara
  final String country;

  /// Pekerjaan
  final String? occupation;

  /// Status Pernikahan
  final String? maritalStatus;

  /// Lead Source
  final String? leadSource;

  /// Catatan
  final String? notes;

  /// Aktif / Tidak
  final bool isActive;

  /// Audit
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