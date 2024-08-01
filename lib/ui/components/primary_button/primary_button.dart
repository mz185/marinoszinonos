
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marinoszinonos/widgets/leading_elevated_button.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? iconData;
  final String text;

  const PrimaryButton({
    super.key,
    this.onPressed,
    this.iconData,
    required this.text
  });

  @override
  build(context) => iconData != null ? LeadingElevatedButton(
      onPressed: onPressed,
      leading: FaIcon(iconData, size: 14),
      label: Text(text)
  ) : ElevatedButton(
      onPressed: onPressed,
      child: Text(text)
  );
}
