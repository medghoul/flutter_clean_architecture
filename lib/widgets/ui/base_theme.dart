import 'package:clean_architecture/resources/res.dart';
import 'package:flutter/material.dart';

const _fontFamily = 'Jost';

class MyAppTheme {
  static ThemeData get getLightMode {
    return ThemeData(
      fontFamily: _fontFamily,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        primary: AppColors.primaryColor,
        secondary: AppColors.secondary,
        tertiary: AppColors.tertiary,
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
      textTheme: const TextTheme(
        ///H1
        headlineLarge: TextStyle(
          color: Colors.black,
          fontFamily: _fontFamily,
          fontSize: 39.06,
          fontWeight: FontWeight.w600,
          height: 0,
        ),

        ///H2
        headlineMedium: TextStyle(
          color: Colors.black,
          fontFamily: _fontFamily,
          fontSize: 31.25,
          fontWeight: FontWeight.w600,
          height: 0,
        ),

        ///H3
        headlineSmall: TextStyle(
          color: Colors.black,
          fontFamily: _fontFamily,
          fontSize: 25,
          fontWeight: FontWeight.w500,
          height: 0,
        ),

        ///H4
        titleLarge: TextStyle(
          color: Colors.black,
          fontFamily: _fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          height: 0,
        ),

        ///BODYTEXT
        bodyMedium: TextStyle(
          color: Colors.black,
          fontFamily: _fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 0,
        ),

        ///CAPTION SMALL
        bodySmall: TextStyle(
          color: Colors.black,
          fontFamily: _fontFamily,
          fontSize: 12.80,
          fontWeight: FontWeight.w300,
          height: 0,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: const IconThemeData(size: 25, color: AppColors.tertiary),
        unselectedIconTheme: IconThemeData(size: 25, color: AppColors.tertiary.withOpacity(0.4)),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 0,
        disabledElevation: 0,
        shape: CircleBorder(),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(Dimension.textFormFieldRadius),
        ),
        suffixIconColor: AppColors.primaryColor650,
        hintStyle: const TextStyle(
          color: AppColors.primaryColor650,
          fontFamily: _fontFamily,
          height: 0,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: Dimension.padding, vertical: Dimension.padding12),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          minimumSize: MaterialStateProperty.all(
            const Size(56, 56),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimension.buttonBorderRadius),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontFamily: _fontFamily, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          minimumSize: MaterialStateProperty.all(
            const Size(56, 56),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimension.buttonBorderRadius),
            ),
          ),
          side: const MaterialStatePropertyAll(
            BorderSide(width: 2, color: AppColors.primaryColor650),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          foregroundColor: MaterialStateProperty.all(AppColors.primaryColor650),
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontFamily: _fontFamily, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  static InputDecoration get secondaryInputFieldStyle => InputDecoration(
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1.5, color: AppColors.primaryColor650),
          borderRadius: BorderRadius.circular(Dimension.textFormFieldRadius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1.5, color: AppColors.red),
          borderRadius: BorderRadius.circular(Dimension.textFormFieldRadius),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.red),
          borderRadius: BorderRadius.circular(Dimension.textFormFieldRadius),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor650),
          borderRadius: BorderRadius.circular(Dimension.textFormFieldRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor650),
          borderRadius: BorderRadius.circular(Dimension.textFormFieldRadius),
        ),
        suffixIconColor: AppColors.primaryColor650,
        hintStyle: const TextStyle(
          color: AppColors.primaryColor650,
          fontFamily: _fontFamily,
          height: 0,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: Dimension.padding, vertical: Dimension.padding12),
      );

  static ThemeData get getDarkMode {
    return ThemeData(
      fontFamily: _fontFamily,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        primary: AppColors.primaryColor,
        secondary: AppColors.secondary,
        tertiary: AppColors.tertiary,
        brightness: Brightness.dark,
      ),
    );
  }
}
