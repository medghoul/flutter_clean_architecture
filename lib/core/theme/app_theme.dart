import 'package:clean_architecture/core/theme/text_theme.dart';
import 'package:clean_architecture/core/resources/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      textTheme: AppTextTheme.lightTextTheme,
      dividerColor: AppColors.darkGray,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: AppColors.white,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.darkGray,
      ),
      cardTheme: CardTheme(
        color: AppColors.white,
        elevation: 4,
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      appBarTheme: AppBarTheme(
        surfaceTintColor: AppColors.white,
        backgroundColor: AppColors.white,
        elevation: 4,
        shadowColor: AppColors.gray.withOpacity(0.5),
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(
          color: AppColors.gray,
          fontFamily: 'WorkSans',
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
      ),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        tileColor: AppColors.white,
        textColor: AppColors.darkGray,
        iconColor: AppColors.darkGray,
        titleTextStyle: TextStyle(
          fontFamily: 'WorkSans',
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.darkGray,
        ),
        subtitleTextStyle: TextStyle(
          fontFamily: 'WorkSans',
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.gray,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.gray,
        thickness: 0.5,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.info,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          textStyle: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,
        prefixStyle: const TextStyle(color: AppColors.gray, fontSize: 20),
        suffixStyle: const TextStyle(color: AppColors.gray, fontSize: 20),
        labelStyle: const TextStyle(color: AppColors.darkGray, fontSize: 20),
        hintStyle: const TextStyle(color: AppColors.darkGray, fontSize: 20),
        errorStyle: const TextStyle(color: AppColors.error, fontSize: 15),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.darkGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.darkGray, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.error, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.error, width: 1.0),
        ),
        errorMaxLines: 2,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          overlayColor: AppColors.gray,
          foregroundColor: AppColors.info,
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle:
            const TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
        menuStyle: MenuStyle(
          surfaceTintColor: WidgetStateProperty.all(AppColors.white),
          backgroundColor: WidgetStateProperty.all(AppColors.white),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.white,
        elevation: 16,
        surfaceTintColor: AppColors.white,
      ),
      iconTheme: const IconThemeData(color: AppColors.darkGray),
      dialogTheme: const DialogTheme(
        backgroundColor: AppColors.white,
        elevation: 16,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      expansionTileTheme: const ExpansionTileThemeData(
        iconColor: AppColors.darkGray,
        textColor: AppColors.darkGray,
        collapsedIconColor: AppColors.darkGray,
        collapsedTextColor: AppColors.darkGray,
        backgroundColor: AppColors.white,
        collapsedBackgroundColor: AppColors.white,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      textTheme: AppTextTheme.darkTextTheme,
      dividerColor: AppColors.white,
      scaffoldBackgroundColor: AppColors.darkGray,
      cardTheme: CardTheme(
        color: AppColors.gray,
        elevation: 4,
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      appBarTheme: AppBarTheme(
        surfaceTintColor: AppColors.darkGray,
        backgroundColor: AppColors.darkGray,
        elevation: 4,
        shadowColor: AppColors.gray.withOpacity(0.5),
        iconTheme: const IconThemeData(color: AppColors.white),
        titleTextStyle: const TextStyle(
          color: AppColors.white,
          fontFamily: 'WorkSans',
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
      ),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        tileColor: AppColors.darkGray,
        textColor: AppColors.white,
        iconColor: AppColors.white,
        titleTextStyle: TextStyle(
          fontFamily: 'WorkSans',
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.white,
        ),
        subtitleTextStyle: TextStyle(
          fontFamily: 'WorkSans',
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.gray,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.gray,
        thickness: 0.5,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.info,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          textStyle: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkGray,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.gray, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.gray),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.error),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.only(left: 25),
        labelStyle: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.normal,
          fontSize: 18,
        ),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle:
            const TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
        menuStyle: MenuStyle(
          surfaceTintColor: WidgetStateProperty.all(AppColors.darkGray),
          backgroundColor: WidgetStateProperty.all(AppColors.darkGray),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.darkGray,
        elevation: 16,
        surfaceTintColor: AppColors.darkGray,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.white,
        selectionColor: AppColors.white,
        selectionHandleColor: AppColors.white,
      ),
      iconTheme: const IconThemeData(color: AppColors.white),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          overlayColor: AppColors.gray,
          foregroundColor: AppColors.info,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      dialogTheme: const DialogTheme(
        backgroundColor: AppColors.darkGray,
        elevation: 16,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      expansionTileTheme: const ExpansionTileThemeData(
        iconColor: AppColors.white,
        textColor: AppColors.white,
        collapsedIconColor: AppColors.white,
        collapsedTextColor: AppColors.white,
        backgroundColor: AppColors.darkGray,
        collapsedBackgroundColor: AppColors.darkGray,
      ),
    );
  }
}
