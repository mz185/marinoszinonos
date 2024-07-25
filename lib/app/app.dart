
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:marinoszinonos/app/app_ui_constants.dart';
import 'package:marinoszinonos/main/main_page.dart';
import 'package:marinoszinonos/utils/palette.dart';

class App extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const App({
    super.key,
    this.savedThemeMode
  });

  @override
  build(context) => AdaptiveTheme(
    light: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.blue,
        scaffoldBackgroundColor: Palette.softWhite,
        switchTheme: AppUiConstants.switchTheme,
        textTheme: AppUiConstants.textLightTheme,
        iconButtonTheme: AppUiConstants.iconButtonTheme
    ),
    dark: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
        scaffoldBackgroundColor: Palette.softBlack,
        switchTheme: AppUiConstants.switchTheme,
        textTheme: AppUiConstants.textDarkTheme,
        iconButtonTheme: AppUiConstants.iconButtonTheme
    ),
    initial: savedThemeMode ?? AdaptiveThemeMode.light,
    builder: (theme, darkTheme) => MaterialApp(
        theme: theme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        home: const MainPage()
    )
  );
}
