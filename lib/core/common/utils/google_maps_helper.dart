import 'package:url_launcher/url_launcher.dart';

class GoogleMapsHelper {
  const GoogleMapsHelper._();

  /// Membuka halaman review Google Maps.
  static Future<void> openReview(String url) async {
    final uri = Uri.tryParse(url);

    if (uri == null) {
      throw ArgumentError('Invalid Google Maps URL: $url');
    }

    final launched = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );

    if (!launched) {
      throw Exception('Could not open Google Maps review URL.');
    }
  }
}