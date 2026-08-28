class TransactionModel {
  final String id;
  final String transactionCode;
  final String type;
  final int amountMinor;
  final String currency;
  final String description;
  final DateTime transactionDate;
  final String? referenceId;
  final String? referenceType;
  final String? branchId;
  final String? customerId;
  final String? packageId;
  final String? notes;
  final DateTime createdAt;
  final String createdBy;

  const TransactionModel({
    required this.id,
    required this.transactionCode,
    required this.type,
    required this.amountMinor,
    required this.currency,
    required this.description,
    required this.transactionDate,
    this.referenceId,
    this.referenceType,
    this.branchId,
    this.customerId,
    this.packageId,
    this.notes,
    required this.createdAt,
    required this.createdBy,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'] as String,
      transactionCode: json['transactionCode'] as String,
      type: json['type'] as String,
      amountMinor: (json['amountMinor'] as num).toInt(),
      currency: json['currency'] as String,
      description: json['description'] as String,
      transactionDate: DateTime.parse(
        json['transactionDate'] as String,
      ),
      referenceId: json['referenceId'] as String?,
      referenceType: json['referenceType'] as String?,
      branchId: json['branchId'] as String?,
      customerId: json['customerId'] as String?,
      packageId: json['packageId'] as String?,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(
        json['createdAt'] as String,
      ),
      createdBy: json['createdBy'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'transactionCode': transactionCode,
      'type': type,
      'amountMinor': amountMinor,
      'currency': currency,
      'description': description,
      'transactionDate': transactionDate.toIso8601String(),
      'referenceId': referenceId,
      'referenceType': referenceType,
      'branchId': branchId,
      'customerId': customerId,
      'packageId': packageId,
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
      'createdBy': createdBy,
    };
  }
}