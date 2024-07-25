
import 'package:flutter/material.dart';

class AutoSizeText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;

  const AutoSizeText({
    super.key,
    required this.text,
    required this.style,
    this.textAlign = TextAlign.start
  });

  @override
  build(context) => LayoutBuilder(
    builder: (context, constraints) {
      double fontSize = style?.fontSize ?? 14;
      final maxWidth = constraints.maxWidth;
      final painter = TextPainter(
        text: TextSpan(
          text: text,
          style: style?.copyWith(fontSize: fontSize)
        ),
        textDirection: TextDirection.ltr,
        textAlign: textAlign
      );

      // Reduce the font size until the text fits within the width
      while (true) {
        painter.layout(maxWidth: maxWidth);
        if (painter.didExceedMaxLines) {
          fontSize--;
          painter.text = TextSpan(
            text: text,
            style: style?.copyWith(fontSize: fontSize)
          );
        } else {
          break;
        }
      }

      return Text(
        text,
        style: style?.copyWith(fontSize: fontSize),
        textAlign: textAlign
      );
    }
  );
}
