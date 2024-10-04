import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor50 = Color(0xFFDEF5F8);
  static const primaryColor175 = Color(0xFF77D3DD);
  static const primaryColor = Color(0xFF006169);
  static const primaryColor525 = Color(0xFF3F777D);
  static const primaryColor650 = Color(0xFF2D585D);
  static const secondary = Color(0xFFDDF56B);
  static const tertiary = Color(0xFFB477DD);
  static const quartiary = Color(0xFFE0C6EF);

  static const lightOrange = Color.fromRGBO(255, 235, 221, 1);
  static const secondaryColor = Color.fromRGBO(219, 91, 5, 1);
  static const secondaryColorDark = Color(0xFF8A8A8A);
  static const backgroundColor = Colors.white;
  static const appBarBackgroundColor = Color(0xFFF9F9F9);
  static const darkModeBackgroundColor = Colors.black87;

  static const disabled = Color(0xFFCFCFCF);

  static const linearGraphBarColor = Colors.grey;
  static const _primaryColorInt = 0xFF1146a9;
  static const _primaryColorR = 17;
  static const _primaryColorG = 70;
  static const _primaryColorB = 169;
  static const accentColor = Color(0xFF00afec);
  static const primaryTextColor = Colors.black;
  static const gray = Color(0xFF47546d);
  static const darkGray = Color(0xFF51564A);
  static const red = Color(0xFFAA0000);
  static const paleGrey = Color(0xFFf2f3f7);
  static const placeholderColor = Color(0xFF47546d);
  static const blueyGray = Color(0xFF93a1bc);
  static const white = Colors.white;
  static const transparentWhite = Color(0x00FFFFFF);
  static const snow = Color(0xFFF9F9F9);
  static const grey = Color(0xFFBDBDBD);
  static const shuttleGrey = Color(0xff656667);
  static const darkGrey = Color(0xff333333);
  static const gray90 = Color(0xffe5e5e5);
  static const blue = Color(0xFF1F9CFC);
  static const facebook = Color.fromARGB(255, 9, 87, 152);
  static const whatsapp = Colors.teal;
  static const statusNew = Colors.blue;
  static const statusOnSale = Colors.amber;
  static const navigationBarColor = Color.fromRGBO(39, 50, 71, 1);

  static const farmersSearchBarColor = Color.fromARGB(255, 208, 207, 207);
  static const farmersSearchBarCircularAvatarColor = Colors.red;

  static const valid = Color(0xFF4E8335);
  static const error = Color(0xFFC1001F);

  static const lightGrey = Color(0xFFF5F5F5);


  static MaterialColor get primaryMaterialColor => const MaterialColor(
    _primaryColorInt,
    {
      50: Color.fromRGBO(_primaryColorR, _primaryColorG, _primaryColorB, .1),
      100: Color.fromRGBO(_primaryColorR, _primaryColorG, _primaryColorB, .2),
      200: Color.fromRGBO(_primaryColorR, _primaryColorG, _primaryColorB, .3),
      300: Color.fromRGBO(_primaryColorR, _primaryColorG, _primaryColorB, .4),
      400: Color.fromRGBO(_primaryColorR, _primaryColorG, _primaryColorB, .5),
      500: Color.fromRGBO(_primaryColorR, _primaryColorG, _primaryColorB, .6),
      600: Color.fromRGBO(_primaryColorR, _primaryColorG, _primaryColorB, .7),
      700: Color.fromRGBO(_primaryColorR, _primaryColorG, _primaryColorB, .8),
      800: Color.fromRGBO(_primaryColorR, _primaryColorG, _primaryColorB, .9),
      900: Color.fromRGBO(_primaryColorR, _primaryColorG, _primaryColorB, 1),
    },
  );
}
