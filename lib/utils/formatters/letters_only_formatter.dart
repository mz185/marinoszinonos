
import 'package:flutter/services.dart';
import 'package:marinoszinonos/utils/regex.dart';

class LettersOnlyFormatter extends TextInputFormatter {

  @override
  TextEditingValue formatEditUpdate(oldValue, newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final newText = newValue.text.replaceAll(RegExp(Regex.letters), '');

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length)
    );
  }
}
