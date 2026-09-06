class JamaahCustomerReference {
  final String value;

  const JamaahCustomerReference(this.value);

  bool get isValid => value.trim().isNotEmpty;

  @override
  bool operator ==(Object other) {
    return other is JamaahCustomerReference && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}
