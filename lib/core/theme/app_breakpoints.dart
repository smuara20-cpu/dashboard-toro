class AppBreakpoints {
  AppBreakpoints._();

  /// Compact layout: phone and narrow tablet.
  static const double compact = 900;

  /// Wide layout: desktop/tablet landscape.
  static const double wide = 1200;

  static bool isCompact(double width) => width < compact;
  static bool isWide(double width) => width >= wide;
}
