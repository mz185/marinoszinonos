
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marinoszinonos/ui/contact/bloc/contact_bloc.dart';
import 'package:marinoszinonos/ui/main/bloc/main_bloc.dart';
import 'package:marinoszinonos/ui/main/main_page.dart';
import 'package:marinoszinonos/utils/palette.dart';

import 'app_ui_constants.dart';

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
          home: MultiBlocProvider(
              providers: [
                BlocProvider<MainBloc>(
                    create: (context) => MainBloc()
                ),
                BlocProvider<ContactBloc>(
                    create: (context) => ContactBloc()
                )
              ],
              child: const MainPage()
          )
      )
  );
}
