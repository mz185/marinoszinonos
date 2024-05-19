
import 'package:flutter/material.dart';
import 'dart:async';

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

  late TextEditingController textController;
  late Timer typingTimer;

  int index = 0;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    _startTyping();
  }

  void _startTyping() {
    const baseDelay = 75;
    typingTimer = Timer.periodic(const Duration(milliseconds: baseDelay), (timer) {
      if (index < widget.text.length) {
        textController.text += widget.text[index];
        index++;
      } else {
        timer.cancel();
        if (widget.onComplete != null) {
          widget.onComplete!();
        }
      }
    });
  }

  @override
  void dispose() {
    typingTimer.cancel();
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