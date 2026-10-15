class LeadModel {
  final String id;
  final String tenantId;
  final String companyId;
  final String ownerId;
  final String leadSource;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  const LeadModel({
    required this.id,
    required this.tenantId,
    required this.companyId,
    required this.ownerId,
    required this.leadSource,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory LeadModel.fromJson(Map<String, dynamic> json) {
    return LeadModel(
      id: json['id'] as String,
      tenantId: json['tenant_id'] as String,
      companyId: json['company_id'] as String,
      ownerId: json['owner_id'] as String,
      leadSource: json['lead_source'] as String,
      status: json['status'] as String,
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
      'company_id': companyId,
      'owner_id': ownerId,
      'lead_source': leadSource,
      'status': status,
      'created_at': createdAt.toUtc().toIso8601String(),
      'updated_at': updatedAt.toUtc().toIso8601String(),
      'deleted_at': deletedAt?.toUtc().toIso8601String(),
    };
  }
}
