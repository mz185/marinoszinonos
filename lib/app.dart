
import 'package:flutter/material.dart';
import 'package:marinoszinonos/widgets/typing_text/typing_text.dart';
import 'package:marinoszinonos/widgets/typing_text/typing_text_entity.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  build(context) => MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true
      ),
      home: const Scaffold(
          body: Background(
              image: 'assets/main_bg.jpg',
              child: Padding(
                  padding: EdgeInsets.all(90),
                  child: Intro()
              )
          )
      )
  );
}

class Background extends StatelessWidget {

  final Widget child;
  final String image;

  const Background({
    required this.child,
    required this.image,
    super.key
  });

  @override
  build(context) => Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover
          )
      ),
      child: child
  );
}

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {

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
