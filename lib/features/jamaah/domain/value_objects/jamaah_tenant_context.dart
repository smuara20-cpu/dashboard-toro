class JamaahTenantContext {
  final String value;

  const JamaahTenantContext(this.value);

  bool get isValid => value.trim().isNotEmpty;

  @override
  bool operator ==(Object other) {
    return other is JamaahTenantContext && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}
