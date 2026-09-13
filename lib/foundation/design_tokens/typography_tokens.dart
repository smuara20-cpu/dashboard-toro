import 'package:flutter/material.dart';

abstract final class VentraTypography {
  static const String fontFamily = 'Inter';
  static const TextStyle display = TextStyle(fontFamily: fontFamily, fontSize: 32, height: 1.2, fontWeight: FontWeight.w700, letterSpacing: -0.6);
  static const TextStyle h1 = TextStyle(fontFamily: fontFamily, fontSize: 28, height: 1.25, fontWeight: FontWeight.w700, letterSpacing: -0.4);
  static const TextStyle h2 = TextStyle(fontFamily: fontFamily, fontSize: 24, height: 1.3, fontWeight: FontWeight.w700, letterSpacing: -0.25);
  static const TextStyle h3 = TextStyle(fontFamily: fontFamily, fontSize: 20, height: 1.35, fontWeight: FontWeight.w700);
  static const TextStyle h4 = TextStyle(fontFamily: fontFamily, fontSize: 18, height: 1.4, fontWeight: FontWeight.w600);
  static const TextStyle h5 = TextStyle(fontFamily: fontFamily, fontSize: 16, height: 1.4, fontWeight: FontWeight.w600);
  static const TextStyle h6 = TextStyle(fontFamily: fontFamily, fontSize: 14, height: 1.45, fontWeight: FontWeight.w600);
  static const TextStyle bodyLarge = TextStyle(fontFamily: fontFamily, fontSize: 16, height: 1.5, fontWeight: FontWeight.w400);
  static const TextStyle body = TextStyle(fontFamily: fontFamily, fontSize: 14, height: 1.5, fontWeight: FontWeight.w400);
  static const TextStyle bodySmall = TextStyle(fontFamily: fontFamily, fontSize: 13, height: 1.45, fontWeight: FontWeight.w400);
  static const TextStyle label = TextStyle(fontFamily: fontFamily, fontSize: 13, height: 1.35, fontWeight: FontWeight.w600);
  static const TextStyle caption = TextStyle(fontFamily: fontFamily, fontSize: 12, height: 1.4, fontWeight: FontWeight.w400);
  static const TextStyle kpi = TextStyle(fontFamily: fontFamily, fontSize: 28, height: 1.15, fontWeight: FontWeight.w700, letterSpacing: -0.35);
  static const TextStyle kpiCompact = TextStyle(fontFamily: fontFamily, fontSize: 22, height: 1.2, fontWeight: FontWeight.w700, letterSpacing: -0.2);
}