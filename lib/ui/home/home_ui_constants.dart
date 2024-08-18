
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marinoszinonos/domain/entities/button_entity.dart';
import 'package:marinoszinonos/ui/home/enum/home_button_id.dart';

class HomeUiConstants {
  static const pageId = 'home';
  static const titleText = 'MARINOS ZINONOS';

  static const double spacingHeight = 8;

  static const aboutButtonId = HomeButtonId.about;
  static const contactButtonId = HomeButtonId.contact;
  static const buttons = [
    // ButtonEntity(id: aboutButtonId, label: 'Learn more'),
    ButtonEntity(
        id: contactButtonId,
        text: 'Get in touch',
        iconData: FontAwesomeIcons.solidEnvelope
    )
  ];
}