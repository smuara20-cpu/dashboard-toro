class PaymentEntity {
  /// Primary Key
  final String id;

  /// Nomor Pembayaran
  final String paymentCode;

  /// Total Tagihan
  final double totalAmount;

  /// Total Dibayar
  final double paidAmount;

  /// Sisa Tagihan
  final double remainingAmount;

  /// Mata Uang
  final String currency;

  /// Status Pembayaran
  ///
  /// Contoh:
  /// Unpaid
  /// Partial
  /// Paid
  /// Refunded
  final String paymentStatus;

  /// Tanggal Jatuh Tempo
  final DateTime? dueDate;

  /// Tanggal Pelunasan
  final DateTime? paidAt;

  /// Catatan
  final String? notes;

  /// Status Aktif
  final bool isActive;

  /// Audit
  final DateTime createdAt;

  final DateTime updatedAt;

  final String createdBy;

  final String? updatedBy;

  const PaymentEntity({
    required this.id,
    required this.paymentCode,
    required this.totalAmount,
    required this.paidAmount,
    required this.remainingAmount,
    required this.currency,
    required this.paymentStatus,
    this.dueDate,
    this.paidAt,
    this.notes,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    this.updatedBy,
  });
}