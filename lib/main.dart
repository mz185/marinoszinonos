import 'package:flutter/material.dart';
import 'package:marinoszinonos/widgets/typing_text/typing_text.dart';
import 'package:marinoszinonos/widgets/typing_text/typing_text_entity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
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
  Widget build(BuildContext context) {
    return Container(
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
}

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {

  int current = 0;

  final List<TypingTextEntity> texts = const [
    TypingTextEntity(
        text: "Hi.",
        fontSize: 64
    ),
    TypingTextEntity(
        text: "I'm Marinos.",
        fontSize: 64,
        delay: 2000
    ),
    TypingTextEntity(
        text: "I’m a software engineer deeply immersed in the mobile development scene. My days are dedicated to transforming complex mobile concepts into intuitive and engaging user experiences. I'm passionate about leveraging the latest mobile technologies and embedding simplicity and efficiency into every application I develop.",
        fontSize: 18,
        delay: 1000
    ),
    TypingTextEntity(
        text: "When I'm not immersed in coding, you're likely to find me hiking through nature, unwinding at the beach, or visiting my village to recharge amidst its tranquility. My love for the outdoors gives me a fresh perspective that I bring back to my work. Interested in technology discussions or need my input on a project? Let’s connect!",
        fontSize: 18,
        delay: 2000
    )
  ];

  void startNextText(int index) {
    if (index < texts.length - 1) {
      final int nextIndex = index + 1;
      final int? delay = texts[nextIndex].delay;
      if (delay != null) {
        Future.delayed(Duration(milliseconds: delay), () {
          setState(() => current = nextIndex);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(texts.length, (index) {
          if (current >= index) {
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
}
