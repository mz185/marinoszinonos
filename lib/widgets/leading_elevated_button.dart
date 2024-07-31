
import 'package:flutter/material.dart';

class LeadingElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget leading;
  final Widget label;

  const LeadingElevatedButton({
    super.key,
    required this.onPressed,
    required this.leading,
    required this.label
  });

  @override
  build(context) => ElevatedButton(
      onPressed: onPressed,
      child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            leading,
            Padding(
                padding: const EdgeInsets.only(left: 8),
                child: label
            )
          ]
      )
  );
}
