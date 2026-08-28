class Money {
  /// Amount stored in the smallest currency unit.
  ///
  /// Examples:
  /// IDR 1,500,000 -> 1500000
  /// USD 125.50    -> 12550
  final int amountMinor;

  /// ISO 4217 currency code.
  ///
  /// Examples:
  /// IDR, USD, SAR, AED, EUR
  final String currency;

  const Money({
    required this.amountMinor,
    required this.currency,
  }) : assert(currency.length == 3);

  /// Zero money for the specified currency.
  const Money.zero({
    required String currency,
  }) : this(
    amountMinor: 0,
    currency: currency,
  );

  bool get isZero => amountMinor == 0;

  bool get isPositive => amountMinor > 0;

  bool get isNegative => amountMinor < 0;

  Money operator +(Money other) {
    _ensureSameCurrency(other);

    return Money(
      amountMinor: amountMinor + other.amountMinor,
      currency: currency,
    );
  }

  Money operator -(Money other) {
    _ensureSameCurrency(other);

    return Money(
      amountMinor: amountMinor - other.amountMinor,
      currency: currency,
    );
  }

  Money operator -() {
    return Money(
      amountMinor: -amountMinor,
      currency: currency,
    );
  }

  bool operator <(Money other) {
    _ensureSameCurrency(other);
    return amountMinor < other.amountMinor;
  }

  bool operator <=(Money other) {
    _ensureSameCurrency(other);
    return amountMinor <= other.amountMinor;
  }

  bool operator >(Money other) {
    _ensureSameCurrency(other);
    return amountMinor > other.amountMinor;
  }

  bool operator >=(Money other) {
    _ensureSameCurrency(other);
    return amountMinor >= other.amountMinor;
  }

  Money abs() {
    return Money(
      amountMinor: amountMinor.abs(),
      currency: currency,
    );
  }

  void _ensureSameCurrency(Money other) {
    if (currency != other.currency) {
      throw ArgumentError(
        'Cannot operate on different currencies: '
            '$currency and ${other.currency}',
      );
    }
  }

  @override
  bool operator ==(Object other) {
    return other is Money &&
        other.amountMinor == amountMinor &&
        other.currency == currency;
  }

  @override
  int get hashCode => Object.hash(
    amountMinor,
    currency,
  );

  @override
  String toString() {
    return 'Money('
        'amountMinor: $amountMinor, '
        'currency: $currency'
        ')';
  }
}