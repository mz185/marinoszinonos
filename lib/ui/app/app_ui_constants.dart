
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marinoszinonos/utils/palette.dart';

class AppUiConstants {
  static const switchTheme = SwitchThemeData(
      overlayColor: WidgetStateColor.transparent
  );

  static const iconButtonTheme = IconButtonThemeData(
      style: ButtonStyle(
          overlayColor: WidgetStateColor.transparent
      )
  );

  static const textLightColor = Palette.darkGrey;
  static const textDarkColor = Palette.lightGrey;

  static const displayLargeTextSizeStyle = TextStyle(
      fontSize: 64,
      fontWeight: FontWeight.bold
  );

  static const displayMediumTextStyle = TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.bold
  );

  static const displaySmallTextStyle = TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold
  );

  static final textLightTheme = TextTheme(
      displayLarge: GoogleFonts.lato(
          color: textLightColor,
          textStyle: displayLargeTextSizeStyle
      ),
      displayMedium: GoogleFonts.lato(
          color: textLightColor,
          textStyle: displayMediumTextStyle
      ),
      displaySmall: GoogleFonts.lato(
          color: textLightColor,
          textStyle: displaySmallTextStyle
      ),
      // headlineLarge: GoogleFonts.lato(color: textLightColor),
      // headlineMedium: GoogleFonts.lato(color: textLightColor),
      // headlineSmall: GoogleFonts.lato(color: textLightColor),
      // titleLarge: GoogleFonts.lato(color: textLightColor),
      // titleMedium: GoogleFonts.lato(color: textLightColor),
      // titleSmall: GoogleFonts.lato(color: textLightColor),
      // bodyLarge: GoogleFonts.lato(color: textLightColor),
      bodyMedium: GoogleFonts.lato(color: textLightColor),
      // bodySmall: GoogleFonts.lato(color: textLightColor),
      // labelLarge: GoogleFonts.lato(color: textLightColor),
      // labelMedium: GoogleFonts.lato(color: textLightColor),
      // labelSmall: GoogleFonts.lato(color: textLightColor)
  );

  static final textDarkTheme = TextTheme(
      displayLarge: GoogleFonts.lato(
          color: textDarkColor,
          textStyle: displayLargeTextSizeStyle
      ),
      displayMedium: GoogleFonts.lato(
          color: textDarkColor,
          textStyle: displayMediumTextStyle
      ),
      displaySmall: GoogleFonts.lato(
          color: textDarkColor,
          textStyle: displaySmallTextStyle
      ),
      // headlineLarge: GoogleFonts.lato(color: textDarkColor),
      // headlineMedium: GoogleFonts.lato(color: textDarkColor),
      // headlineSmall: GoogleFonts.lato(color: textDarkColor),
      // titleLarge: GoogleFonts.lato(color: textDarkColor),
      // titleMedium: GoogleFonts.lato(color: textDarkColor),
      // titleSmall: GoogleFonts.lato(color: textDarkColor),
      // bodyLarge: GoogleFonts.lato(color: textDarkColor),
      bodyMedium: GoogleFonts.lato(color: textDarkColor),
      // bodySmall: GoogleFonts.lato(color: textDarkColor),
      // labelLarge: GoogleFonts.lato(color: textDarkColor),
      // labelMedium: GoogleFonts.lato(color: textDarkColor),
      // labelSmall: GoogleFonts.lato(color: textDarkColor)
  );
}