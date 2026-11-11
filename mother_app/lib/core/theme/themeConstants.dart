import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF346E60);
  static const Color onPrimary = Color(0xFFFFFFFF);
  // static const Color primaryDark = Color(0xFF087F50);
  static const Color primaryBright = Color(0xFF43E45C);

  static const Color secondary = Color(0xFFDDE6E3);
  static const Color onSecondary = Color(0xFF263B37);
  // static const Color secondaryDark = Color(0xFF1976D2);

  static const Color tertiary = Color(0xFFAF7A28);
  static const Color onTertiary = Color(0xFF263B37);
  // static const Color tertiaryDark = Color(0xFF1976D2);

  static const Color scaffoldBackground = Color(0XFFF7FAF9);
  static const Color scaffoldBackgroundDark = Color(
    0xFF121212,
  ); // Dark background

  //
  static const Color surface = Color(0xFFFCFDFD); // very light gray
  static const Color onInverseSurface = Color(0xFF263B37);
  static const Color surfaceBright = Color(0xFFFFFFFF);
  // static const Color surfaceDark = Color();
  static const Color onInverseSurfaceDark = Color.fromARGB(255, 239, 239, 240);
  static const Color appBar = Colors.transparent;
  static const Color appBarDark = Colors.transparent;
  // static const Color divider = Color(0xFFBDBDBD); // Divider color
  // static const Color buttonColor = Color(0xFF03A9F4); // Button color
  static const Color error = Color(0xFFAF2828); // Error color
  static const Color onError = Color.fromARGB(255, 255, 255, 255);
  static const Color shadow = Color.fromRGBO(52, 110, 96, 0.25);
  // Texts
  static const Color titleColor = Color(0xFF263B37);
  static const Color bodyColor = Color(0xFF263B37);
  static const Color labelColor = Color(0xFF346E60);
  static const Color disableColor = Color(0xFFB0B0B0);

  // static const Color titleColorDark = Color(0xFFDEDEDE);
  // static const Color titleColorDarkLow = Color.fromRGBO(222, 222, 222, 0.7);
  // static const Color bodyColorDark = Color(0xFFBDBDBD);
  // static const Color labelColorDark = Color(0xFF087F50);
  // static const Color disableColorDark = Color.fromARGB(255, 248, 248, 248);

  static const Color surfaceContainer = Color(0xFFFCFDFD);

  static WidgetStateProperty<Color?> overlayColor =
      WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.pressed)) {
          return AppColors.primary.withOpacity(0.2); // splash / pressed
        }
        if (states.contains(WidgetState.hovered)) {
          return AppColors.primary.withOpacity(0.15); // hover
        }
        if (states.contains(WidgetState.focused)) {
          return AppColors.surface.withOpacity(
            0.10,
          ); // focus (keyboard / click)
        }
        return null;
      });
}
