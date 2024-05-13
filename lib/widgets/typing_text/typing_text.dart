
import 'package:flutter/material.dart';

class TypingText extends StatefulWidget {

  final String text;
  final TextStyle? textStyle;
  final VoidCallback? onComplete;

  const TypingText(this.text, {
    this.textStyle,
    this.onComplete,
    super.key
  });

  @override
  TypingTextState createState() => TypingTextState();
}

class TypingTextState
    extends State<TypingText>
    with SingleTickerProviderStateMixin {

  late String text;
  late TextEditingController textController;
  late AnimationController animationController;

  int index = 0;

  @override
  void initState() {
    super.initState();
    text = widget.text;
    textController = TextEditingController();
    animationController = AnimationController(
        duration: Duration(milliseconds: text.length * 50),
        vsync: this
    );

    animationController.addListener(() {
      if (index < widget.text.length) {
        textController.text += widget.text[index];
        index++;
      } else {
        animationController.stop();
        widget.onComplete?.call();
      }
    });

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: textController,
        readOnly: true,
        maxLines: null,
        style: widget.textStyle,
        decoration: const InputDecoration(
            border: InputBorder.none
        )
    );
  }
}