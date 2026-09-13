import 'package:flutter/material.dart';

abstract final class VentraElevation {
  static const List<BoxShadow> none = <BoxShadow>[];
  static const List<BoxShadow> sm = <BoxShadow>[BoxShadow(color: Color(0x14000000), blurRadius: 6, offset: Offset(0, 2))];
  static const List<BoxShadow> md = <BoxShadow>[BoxShadow(color: Color(0x18000000), blurRadius: 12, offset: Offset(0, 4))];
  static const List<BoxShadow> lg = <BoxShadow>[BoxShadow(color: Color(0x1F000000), blurRadius: 24, offset: Offset(0, 8))];
}