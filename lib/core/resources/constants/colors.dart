import 'package:flutter/material.dart';

class AppColors {
  // Primary colors
  static const primary = Color(0xFF006169);
  static const primaryLight = Color(0xFFDEF5F8);
  static const primaryDark = Color(0xFF2D585D);

  // Secondary colors
  static const secondary = Color(0xFFDDF56B);
  static const secondaryDark = Color(0xFF8A8A8A);

  // Accent colors
  static const accent = Color(0xFF00afec);
  static const tertiary = Color(0xFFB477DD);
  static const quaternary = Color(0xFFE0C6EF);

  // Neutral colors
  static const black = Color(0xFF000000);
  static const white = Colors.white;
  static const transparent = Colors.transparent;
  static const snow = Color(0xFFF9F9F9);

  // Gray shades
  static const gray = Color(0xFF47546D);
  static const darkGray = Color(0xFF51564A);
  static const lightGray = Color(0xFFF5F5F5);
  static const shuttleGray = Color(0xFF656667);

  // Functional colors
  static const error = Color(0xFFC1001F);
  static const success = Color(0xFF4E8335);
  static const warning = Colors.amber;
  static const info = Color(0xFF1F9CFC);

  // Social media colors
  static const facebook = Color(0xFF0957A8);
  static const whatsapp = Colors.teal;

  // Status colors
  static const statusNew = Colors.blue;
  static const statusOnSale = Colors.amber;

  // Background colors
  static const background = Colors.white;
  static const darkModeBackground = Colors.black87;
  static const appBarBackground = Color(0xFFF9F9F9);

  // Text colors
  static const primaryText = Colors.black;
  static const secondaryText = Color(0xFF47546D);
  static const placeholderText = Color(0xFF93A1BC);

  // Disabled state
  static const disabled = Color(0xFFCFCFCF);

  // Generate material color
  static MaterialColor getMaterialColor(Color color) {
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;

    final Map<int, Color> shades = {
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    };

    return MaterialColor(color.value, shades);
  }

  // Example of how to use getMaterialColor
  static MaterialColor get primaryMaterial => getMaterialColor(primary);
}
