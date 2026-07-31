class PackageEntity {
  /// Primary Key
  final String id;

  /// Kode Paket
  final String packageCode;

  /// Nama Paket
  final String packageName;

  /// Jenis Paket
  ///
  /// Contoh:
  /// Umroh
  /// Haji
  /// Muslim Tour
  final String packageType;

  /// Negara Tujuan
  final String destinationCountry;

  /// Kota Tujuan
  final List<String> destinations;

  /// Lama Perjalanan
  final int duration;

  /// Tanggal Keberangkatan
  final DateTime departureDate;

  /// Tanggal Kepulangan
  final DateTime returnDate;

  /// Harga Dasar
  final double price;

  /// Mata Uang
  final String currency;

  /// Kuota Jamaah
  final int quota;

  /// Sisa Kuota
  final int availableSeat;

  /// Status Aktif
  final bool isActive;

  /// Catatan
  final String? notes;

  /// Audit
  final DateTime createdAt;

  final DateTime updatedAt;

  final String createdBy;

  final String? updatedBy;

  const PackageEntity({
    required this.id,
    required this.packageCode,
    required this.packageName,
    required this.packageType,
    required this.destinationCountry,
    required this.destinations,
    required this.duration,
    required this.departureDate,
    required this.returnDate,
    required this.price,
    required this.currency,
    required this.quota,
    required this.availableSeat,
    required this.isActive,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    this.updatedBy,
  });
}