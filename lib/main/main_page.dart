
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:marinoszinonos/home/ui/home_page.dart';
import 'package:marinoszinonos/main/main_ui_constants.dart';
import 'package:marinoszinonos/widgets/theme_switch.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  build(context) => Scaffold(
      appBar: AppBar(
          forceMaterialTransparency: true,
          actions: [
            Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: MainUiConstants.switchHorizontalPadding
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
      body: const Padding(
          padding: EdgeInsets.all(MainUiConstants.pagePadding),
          child: HomePage()
      )
  );
}
