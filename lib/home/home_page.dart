
import 'package:flutter/material.dart';

import '../widgets/typing_text/typing_text.dart';
import '../widgets/typing_text/typing_text_entity.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int counter = 0;

  final texts = const [
    TypingTextEntity(
        text: "Hi.",
        fontSize: 64,
        delay: 1000
    ),
    TypingTextEntity(
        text: "I'm Marinos.",
        fontSize: 64,
        delay: 1000
    ),
    TypingTextEntity(
        text: "I'm a software engineer specializing in mobile development.",
        fontSize: 18,
        delay: 2000
    ),
    TypingTextEntity(
        text: "Interested in discussing technology or collaborating?",
        fontSize: 18,
        delay: 1000
    ),
    TypingTextEntity(
        text: "Let's connect!", // Make it a button
        fontSize: 18,
        delay: 2000
    )
  ];

  void startNextText(int index) {
    if (index < texts.length - 1) {
      final nextIndex = index + 1;
      final delay = texts[nextIndex].delay;
      if (delay != null) {
        Future.delayed(Duration(milliseconds: delay), () {
          setState(() => counter = nextIndex);
        });
      }
    }
  }

  @override
  build(context) => Column(
      children: List.generate(texts.length, (index) {
        if (counter >= index) {
          return TypingText(
              texts[index].text,
              textStyle: TextStyle(
                  fontSize: texts[index].fontSize,
                  color: Colors.white
              ),
              onComplete: () => startNextText(index)
          );
        }
        return const SizedBox.shrink();
      }).toList()
  );
}
