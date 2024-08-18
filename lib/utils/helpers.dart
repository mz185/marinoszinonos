
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

Future<void> launchUrl(String url) async {
  final uri = Uri.parse(url);
  if (!await launcher.launchUrl(uri)) {
    // Note: Always returns false but there is an issue open:
    // https://github.com/flutter/flutter/issues/139783
    // TODO: Log error
    if (kDebugMode) {
      debugPrint('Could not launch $uri');
    }
  }
}