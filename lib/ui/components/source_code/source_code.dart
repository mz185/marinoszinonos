
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marinoszinonos/ui/components/source_code/source_code_ui_constants.dart';
import 'package:marinoszinonos/utils/helpers.dart';
import 'package:marinoszinonos/widgets/leading_elevated_button.dart';

class SourceCode extends StatelessWidget {
  const SourceCode({super.key});

  @override
  build(context) => LeadingElevatedButton(
      onPressed: () => launchUrl(SourceCodeUiConstants.sourceCodeUrl),
      leading: const FaIcon(FontAwesomeIcons.solidFileCode, size: 14),
      label: const Text(SourceCodeUiConstants.sourceCodeText)
  );
}