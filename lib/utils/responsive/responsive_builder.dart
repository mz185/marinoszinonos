
import 'package:flutter/material.dart';

import 'helpers.dart';

class ResponsiveBuilder extends StatelessWidget {

  final Widget mobile;
  final Widget desktop;
  final Widget? tablet;

  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    required this.desktop,
    this.tablet
  });

  @override
  build(context) => responsive(
      context,
      desktop: desktop,
      tablet: tablet ?? mobile,
      mobile: mobile
  );
}
