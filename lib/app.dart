
import 'package:flutter/material.dart';
import 'package:marinoszinonos/home/home_page.dart';

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
                  padding: EdgeInsets.all(72),
                  child: HomePage()
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
