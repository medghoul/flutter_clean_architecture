import 'package:clean_architecture/core/theme/text_theme.dart';
import 'package:clean_architecture/resources/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      textTheme: AppTextTheme.lightTextTheme,
      dividerColor: AppColors.grey,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: AppColors.white,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.darkGrey,
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
        shadowColor: AppColors.grey.withOpacity(0.5),
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(
          color: AppColors.primaryTextColor,
          fontFamily: 'WorkSans',
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
      ),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        tileColor: AppColors.white,
        textColor: AppColors.darkGrey,
        iconColor: AppColors.darkGrey,
        titleTextStyle: TextStyle(
          fontFamily: 'WorkSans',
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.darkGrey,
        ),
        subtitleTextStyle: TextStyle(
          fontFamily: 'WorkSans',
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.grey,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.grey,
        thickness: 0.5,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.blue,
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
        prefixStyle: const TextStyle(color: AppColors.grey, fontSize: 20),
        suffixStyle: const TextStyle(color: AppColors.grey, fontSize: 20),
        labelStyle: const TextStyle(color: AppColors.darkGrey, fontSize: 20),
        hintStyle: const TextStyle(color: AppColors.darkGrey, fontSize: 20),
        errorStyle: const TextStyle(color: AppColors.red, fontSize: 15),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.darkGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.darkGrey, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.red, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.red, width: 1.0),
        ),
        errorMaxLines: 2,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          overlayColor: AppColors.grey,
          foregroundColor: AppColors.blue,
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
      iconTheme: const IconThemeData(color: AppColors.darkGrey),
      dialogTheme: const DialogTheme(
        backgroundColor: AppColors.white,
        elevation: 16,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      expansionTileTheme: const ExpansionTileThemeData(
        iconColor: AppColors.darkGrey,
        textColor: AppColors.darkGrey,
        collapsedIconColor: AppColors.darkGrey,
        collapsedTextColor: AppColors.darkGrey,
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
      scaffoldBackgroundColor: AppColors.darkGrey,
      cardTheme: CardTheme(
        color: AppColors.grey,
        elevation: 4,
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      appBarTheme: AppBarTheme(
        surfaceTintColor: AppColors.darkGrey,
        backgroundColor: AppColors.darkGrey,
        elevation: 4,
        shadowColor: AppColors.grey.withOpacity(0.5),
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
        tileColor: AppColors.darkGrey,
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
          color: AppColors.grey,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.grey,
        thickness: 0.5,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.blue,
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
        fillColor: AppColors.darkGrey,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.grey, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.red),
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
          surfaceTintColor: WidgetStateProperty.all(AppColors.darkGrey),
          backgroundColor: WidgetStateProperty.all(AppColors.darkGrey),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.darkGrey,
        elevation: 16,
        surfaceTintColor: AppColors.darkGrey,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.white,
        selectionColor: AppColors.white,
        selectionHandleColor: AppColors.white,
      ),
      iconTheme: const IconThemeData(color: AppColors.white),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          overlayColor: AppColors.grey,
          foregroundColor: AppColors.blue,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      dialogTheme: const DialogTheme(
        backgroundColor: AppColors.darkGrey,
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
        backgroundColor: AppColors.darkGrey,
        collapsedBackgroundColor: AppColors.darkGrey,
      ),
    );
  }
}
