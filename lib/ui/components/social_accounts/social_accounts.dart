
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marinoszinonos/ui/components/social_accounts/social_accounts_ui_constants.dart';
import 'package:marinoszinonos/utils/helpers.dart';

class SocialAccounts extends StatelessWidget {
  const SocialAccounts({super.key});

  @override
  build(context) => ButtonBar(
      alignment: MainAxisAlignment.center,
      buttonPadding: EdgeInsets.zero,
      children: [
        IconButton(
            onPressed: () => launchUrl(SocialAccountsUiConstants.githubUrl),
            icon: const FaIcon(FontAwesomeIcons.github)
        ),
        IconButton(
            onPressed: () => launchUrl(SocialAccountsUiConstants.linkedinUrl),
            icon: const FaIcon(FontAwesomeIcons.linkedinIn)
        )
      ]
  );
}
