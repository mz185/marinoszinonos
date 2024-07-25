
import 'package:flutter/material.dart';

extension ScreenWidth on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;
}