import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class GoogleMapsHelper {
  static Future<void> openReview() async {
    const placeId = 'ChIJLQ1DCMuMaS4RgiFXGCNjmA0';

    final reviewUri = Uri.parse(
      'https://search.google.com/local/writereview?placeid=$placeId',
    );

    debugPrint('Opening review: $reviewUri');

    final launched = await launchUrl(
      reviewUri,
      mode: LaunchMode.externalApplication,
    );

    if (!launched) {
      throw Exception('Tidak dapat membuka Google Maps.');
    }
  }
}
