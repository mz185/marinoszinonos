
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:marinoszinonos/contact/contact_page.dart';
import 'package:marinoszinonos/home/home_page.dart';
import 'package:marinoszinonos/main/main_ui_constants.dart';
import 'package:marinoszinonos/widgets/theme_switch.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();

  @override
  dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const ContactPage();
    }
    return const SizedBox.shrink();
  }

  @override
  build(context) => Scaffold(
      appBar: AppBar(
          forceMaterialTransparency: true,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: MainUiConstants.pagePadding
                ),
                child: ThemeSwitch(
                    isDarkMode: AdaptiveTheme.of(context).mode.isDark,
                    onChanged: (value) {
                      if (value) {
                        AdaptiveTheme.of(context).setDark();
                      } else {
                        AdaptiveTheme.of(context).setLight();
                      }
                    }
                )
            )
          ]
      ),
      body: Padding(
          padding: const EdgeInsets.all(MainUiConstants.pagePadding),
          child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              pageSnapping: false,
              clipBehavior: Clip.none,
              padEnds: false,
              itemCount: MainUiConstants.pages,
              itemBuilder: (context, index) => _getPage(index)
          )
      )
  );
}
