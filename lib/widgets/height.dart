
import 'package:flutter/material.dart';

class Height extends StatelessWidget {
  final double value;

  const Height(this.value, {super.key});

  @override
  build(context) => SizedBox(height: value);
}
