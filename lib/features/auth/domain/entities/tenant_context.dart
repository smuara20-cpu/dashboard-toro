class TenantContext {
  final String tenantId;
  final String companyId;

  const TenantContext({required this.tenantId, required this.companyId});

  bool get isValid => tenantId.trim().isNotEmpty && companyId.trim().isNotEmpty;

  TenantContext copyWith({String? tenantId, String? companyId}) {
    return TenantContext(
      tenantId: tenantId ?? this.tenantId,
      companyId: companyId ?? this.companyId,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is TenantContext &&
            other.tenantId == tenantId &&
            other.companyId == companyId;
  }

  @override
  int get hashCode => Object.hash(tenantId, companyId);

  @override
  String toString() {
    return 'TenantContext('
        'tenantId: $tenantId, '
        'companyId: $companyId'
        ')';
  }
}
