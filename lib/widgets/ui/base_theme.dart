import 'package:clean_architecture/core/resources/res.dart';
import 'package:flutter/material.dart';

const _fontFamily = 'Jost';

class MyAppTheme {
  static ThemeData get getLightMode {
    return ThemeData(
      fontFamily: _fontFamily,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
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
          borderRadius: BorderRadius.circular(AppDimensions.borderRadiusM),
        ),
        suffixIconColor: AppColors.primary,
        hintStyle: const TextStyle(
          color: AppColors.primary,
          fontFamily: _fontFamily,
          height: 0,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: AppDimensions.paddingM, vertical: AppDimensions.padding12),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0),
          minimumSize: WidgetStateProperty.all(
            const Size(56, 56),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimensions.borderRadiusM),
            ),
          ),
          backgroundColor: WidgetStateProperty.all(AppColors.primary),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          textStyle: WidgetStateProperty.all(
            const TextStyle(fontFamily: _fontFamily, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0),
          minimumSize: WidgetStateProperty.all(
            const Size(56, 56),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimensions.borderRadiusM),
            ),
          ),
          side: const WidgetStatePropertyAll(
            BorderSide(width: 2, color: AppColors.primary),
          ),
          backgroundColor: WidgetStateProperty.all(Colors.white),
          foregroundColor: WidgetStateProperty.all(AppColors.primary),
          textStyle: WidgetStateProperty.all(
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
          borderSide: const BorderSide(width: 1.5, color: AppColors.primary),
          borderRadius: BorderRadius.circular(AppDimensions.borderRadiusM),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1.5, color: AppColors.error),
          borderRadius: BorderRadius.circular(AppDimensions.borderRadiusM),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.error),
          borderRadius: BorderRadius.circular(AppDimensions.borderRadiusM),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(AppDimensions.borderRadiusM),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(AppDimensions.borderRadiusM),
        ),
        suffixIconColor: AppColors.primary,
        hintStyle: const TextStyle(
          color: AppColors.primary,
          fontFamily: _fontFamily,
          height: 0,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: AppDimensions.paddingM, vertical: AppDimensions.padding12),
      );

  static ThemeData get getDarkMode {
    return ThemeData(
      fontFamily: _fontFamily,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        tertiary: AppColors.tertiary,
        brightness: Brightness.dark,
      ),
    );
  }
}
