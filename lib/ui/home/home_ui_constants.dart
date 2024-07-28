
import 'package:marinoszinonos/domain/entities/button_entity.dart';
import 'package:marinoszinonos/ui/home/enum/home_button_id.dart';

class HomeUiConstants {
  static const title = 'MARINOS ZINONOS';
  static const githubUrl = 'https://github.com/mz185';
  static const linkedinUrl = 'https://www.linkedin.com/in/marinos-zinonos-963675313/';
  static const double spacingHeight = 8;

  static const aboutButtonId = HomeButtonId.about;
  static const contactButtonId = HomeButtonId.contact;
  static const buttons = [
    // ButtonEntity(id: aboutButtonId, label: 'Learn more'),
    ButtonEntity(id: contactButtonId, label: 'Get in touch')
  ];
}