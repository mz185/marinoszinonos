import 'package:flutter/material.dart';

class FadeInWidget extends StatefulWidget {
  final Widget child;
  final int fadeInMillis;

  const FadeInWidget({
    required this.child,
    this.fadeInMillis = 2000,
    super.key,
  });

  @override
  FadeInWidgetState createState() => FadeInWidgetState();
}

class FadeInWidgetState
    extends State<FadeInWidget>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: widget.fadeInMillis),
      vsync: this
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  build(context) => FadeTransition(
      opacity: _animation,
      child: widget.child
  );
}
