
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:marinoszinonos/utils/extensions.dart';
import 'package:marinoszinonos/utils/responsive/screen_type.dart';

import 'breakpoints.dart';

ScreenType getScreenType(BuildContext context) {
  final width = context.screenWidth;

  if (width >= Breakpoints.desktop) {
    return ScreenType.desktop;
  }

  if (width >= Breakpoints.tablet) {
    return ScreenType.tablet;
  }

  return ScreenType.mobile;
}

T responsive<T>(BuildContext context, {
  required T desktop,
  required T mobile,
  T? tablet
}) {
  final screenType = getScreenType(context);

  if (kDebugMode) {
    print(screenType.toString());
  }

  switch (screenType) {
    case ScreenType.mobile:
      return mobile;
    case ScreenType.tablet:
      return tablet ?? mobile;
    case ScreenType.desktop:
      return desktop;
  }
}
