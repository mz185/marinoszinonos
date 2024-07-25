
import 'package:flutter/material.dart';

class Width extends StatelessWidget {
  final double value;

  const Width(this.value, {super.key});

  @override
  build(context) => SizedBox(width: value);
}
