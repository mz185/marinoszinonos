
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marinoszinonos/ui/components/primary_button/primary_button.dart';
import 'package:marinoszinonos/ui/components/source_code/source_code_ui_constants.dart';
import 'package:marinoszinonos/utils/helpers.dart';

class SourceCode extends StatelessWidget {
  const SourceCode({super.key});

  @override
  build(context) => PrimaryButton(
      onPressed: () => launchUrl(SourceCodeUiConstants.sourceCodeUrl),
      iconData: FontAwesomeIcons.solidFileCode,
      text: SourceCodeUiConstants.sourceCodeText
  );
}