class JamaahBusinessNumber {
  final String value;

  const JamaahBusinessNumber(this.value);

  bool get isValid => value.trim().isNotEmpty;

  @override
  bool operator ==(Object other) {
    return other is JamaahBusinessNumber && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}
