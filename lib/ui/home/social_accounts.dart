
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home_ui_constants.dart';

class SocialAccounts extends StatelessWidget {
  const SocialAccounts({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      // Note: Always returns false but there is an issue open:
      // https://github.com/flutter/flutter/issues/139783
      // TODO: Log error with crashlytics
      if (kDebugMode) {
        debugPrint('Could not launch $uri');
      }
    }
  }

  @override
  build(context) => ButtonBar(
      alignment: MainAxisAlignment.center,
      buttonPadding: EdgeInsets.zero,
      children: [
        IconButton(
            onPressed: () => _launchUrl(HomeUiConstants.githubUrl),
            icon: const FaIcon(FontAwesomeIcons.github)
        ),
        IconButton(
            onPressed: () => _launchUrl(HomeUiConstants.linkedinUrl),
            icon: const FaIcon(FontAwesomeIcons.linkedinIn)
        )
      ]
  );
}
