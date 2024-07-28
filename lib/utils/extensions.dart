
import 'package:flutter/material.dart';

extension ScreenWidth on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;
}

extension ReplaceStringPlaceholder on String {
  String replacePlaceholders({
    required Map<String, String> values
  }) => replaceAllMapped(RegExp(r'%(\w+)%'), (match) {
    final key = match.group(1);
    return values[key] ?? match.group(0)!;
  });
}