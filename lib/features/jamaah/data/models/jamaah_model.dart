class JamaahModel {
  final String id;
  final String tenantId;
  final String customerId;
  final String jamaahCode;
  final Map<String, dynamic> identityData;
  final String status;
  final String lifecycle;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  const JamaahModel({
    required this.id,
    required this.tenantId,
    required this.customerId,
    required this.jamaahCode,
    required this.identityData,
    required this.status,
    required this.lifecycle,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory JamaahModel.fromJson(Map<String, dynamic> json) {
    return JamaahModel(
      id: json['id'] as String,
      tenantId: json['tenant_id'] as String,
      customerId: json['customer_id'] as String,
      jamaahCode: json['jamaah_code'] as String,
      identityData: Map<String, dynamic>.from(json['identity_data'] as Map),
      status: json['status'] as String,
      lifecycle: json['lifecycle'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tenant_id': tenantId,
      'customer_id': customerId,
      'jamaah_code': jamaahCode,
      'identity_data': identityData,
      'status': status,
      'lifecycle': lifecycle,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'deleted_at': deletedAt?.toIso8601String(),
    };
  }
}
