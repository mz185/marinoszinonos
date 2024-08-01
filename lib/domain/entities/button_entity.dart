
import 'package:flutter/widgets.dart';
import 'package:marinoszinonos/ui/abstract/button_id.dart';

class ButtonEntity {
  final ButtonId id;
  final String text;
  final IconData? iconData;

  const ButtonEntity({
    required this.id,
    required this.text,
    this.iconData
  });
}
