import 'package:flutter/material.dart';

class GoogleMapsHelper {
  const GoogleMapsHelper._();

  static Uri buildDirectionUri({
    required double latitude,
    required double longitude,
  }) {
    return Uri.parse(
      'https://www.google.com/maps/dir/?api=1'
          '&destination=$latitude,$longitude',
    );
  }
}