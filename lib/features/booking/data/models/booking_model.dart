class BookingModel {
  final String id;

  final String bookingCode;

  final DateTime bookingDate;

  final DateTime departureDate;

  /// Customer disimpan sebagai JSON Map.
  final Map<String, dynamic> customer;

  /// Package disimpan sebagai JSON Map.
  final Map<String, dynamic> package;

  /// Payment disimpan sebagai JSON Map.
  final Map<String, dynamic> payment;

  /// Lead source.
  final String leadSource;

  /// Booking status.
  final String status;

  final DateTime createdAt;

  final DateTime updatedAt;

  const BookingModel({
    required this.id,
    required this.bookingCode,
    required this.bookingDate,
    required this.departureDate,
    required this.customer,
    required this.package,
    required this.payment,
    required this.leadSource,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'] as String,
      bookingCode: json['bookingCode'] as String,
      bookingDate: DateTime.parse(
        json['bookingDate'] as String,
      ),
      departureDate: DateTime.parse(
        json['departureDate'] as String,
      ),
      customer: Map<String, dynamic>.from(
        json['customer'] as Map,
      ),
      package: Map<String, dynamic>.from(
        json['package'] as Map,
      ),
      payment: Map<String, dynamic>.from(
        json['payment'] as Map,
      ),
      leadSource: json['leadSource'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(
        json['createdAt'] as String,
      ),
      updatedAt: DateTime.parse(
        json['updatedAt'] as String,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bookingCode': bookingCode,
      'bookingDate': bookingDate.toIso8601String(),
      'departureDate': departureDate.toIso8601String(),
      'customer': customer,
      'package': package,
      'payment': payment,
      'leadSource': leadSource,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}