import 'package:clean_architecture/core/constants/app_colors.dart';
import 'package:clean_architecture/core/constants/global_constants.dart';
import 'package:clean_architecture/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      textTheme: AppTextTheme.lightTextTheme,
      dividerColor: AppColors.grey300,
      scaffoldBackgroundColor: AppColors.white,
      iconTheme: const IconThemeData(color: AppColors.black),
      canvasColor: AppColors.grey200,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.grey700,
        selectionColor: AppColors.primary,
        selectionHandleColor: AppColors.primary,
      ),
      cardTheme: CardTheme(
        elevation: 0,
        color: AppColors.grey200,
        margin: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(GlobalConstants.radiusM),
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
      ),
      appBarTheme: const AppBarTheme(
        surfaceTintColor: AppColors.white,
        backgroundColor: AppColors.white,
        elevation: 0,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppColors.black),
        scrolledUnderElevation: 0,
        titleTextStyle: TextStyle(
          color: AppColors.black,
          fontFamily: 'WorkSans',
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
      ),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        tileColor: AppColors.white,
        textColor: AppColors.black,
        iconColor: AppColors.black,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.grey300,
        thickness: 0.5,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,
        prefixStyle: AppTextTheme.lightTextTheme.bodyLarge
            ?.copyWith(color: AppColors.grey300),
        suffixStyle: AppTextTheme.lightTextTheme.bodyLarge
            ?.copyWith(color: AppColors.grey300),
        labelStyle: AppTextTheme.lightTextTheme.bodyLarge
            ?.copyWith(color: AppColors.black),
        hintStyle: AppTextTheme.lightTextTheme.bodyLarge
            ?.copyWith(color: AppColors.black),
        errorStyle: AppTextTheme.lightTextTheme.bodySmall
            ?.copyWith(color: AppColors.error),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GlobalConstants.radiusM),
          borderSide: const BorderSide(color: AppColors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GlobalConstants.radiusM),
          borderSide: const BorderSide(color: AppColors.black, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GlobalConstants.radiusM),
          borderSide: const BorderSide(color: AppColors.error, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GlobalConstants.radiusM),
          borderSide: const BorderSide(color: AppColors.error, width: 1.0),
        ),
        errorMaxLines: 2,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          overlayColor: AppColors.grey300,
          foregroundColor: AppColors.primary,
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        menuStyle: MenuStyle(
          surfaceTintColor: WidgetStateProperty.all(AppColors.white),
          backgroundColor: WidgetStateProperty.all(AppColors.white),
          elevation: WidgetStateProperty.all(4),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(GlobalConstants.radiusM),
            ),
          ),
        ),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.white,
        elevation: 16,
        surfaceTintColor: AppColors.white,
      ),
      dialogTheme: const DialogTheme(
        backgroundColor: AppColors.white,
        elevation: 16,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(GlobalConstants.radiusM)),
        ),
      ),
      expansionTileTheme: const ExpansionTileThemeData(
        iconColor: AppColors.grey700,
        textColor: AppColors.grey700,
        collapsedIconColor: AppColors.grey700,
        collapsedTextColor: AppColors.grey700,
        backgroundColor: AppColors.white,
        collapsedBackgroundColor: AppColors.white,
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        headerBackgroundColor: AppColors.primary,
        headerForegroundColor: AppColors.white,
        dayBackgroundColor:
            WidgetStateProperty.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return AppColors.white;
        }),
        dayForegroundColor:
            WidgetStateProperty.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.white;
          }
          return AppColors.black;
        }),
        yearForegroundColor:
            WidgetStateProperty.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.white;
          }
          return AppColors.black;
        }),
        todayForegroundColor: const WidgetStatePropertyAll(AppColors.primary),
        todayBackgroundColor:
            WidgetStatePropertyAll(AppColors.primary.withAlpha(10)),
      ),
      timePickerTheme: const TimePickerThemeData(
        backgroundColor: AppColors.white,
        hourMinuteColor: AppColors.white,
        hourMinuteTextColor: AppColors.black,
        dialHandColor: AppColors.primary,
        dialBackgroundColor: AppColors.grey200,
        dialTextColor: AppColors.black,
      ),
      searchViewTheme: SearchViewThemeData(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        dividerColor: AppColors.grey300,
        headerTextStyle: AppTextTheme.lightTextTheme.labelMedium,
        headerHintStyle: AppTextTheme.lightTextTheme.labelMedium
            ?.copyWith(color: AppColors.grey300),
      ),
      colorScheme: ColorScheme.light(
        surface: AppColors.white,
        surfaceTint: AppColors.white,
        surfaceBright: AppColors.white,
        surfaceContainer: AppColors.grey200,
        onSurface: AppColors.black,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      textTheme: AppTextTheme.darkTextTheme,
      dividerColor: AppColors.white,
      canvasColor: AppColors.black,
      iconTheme: const IconThemeData(color: AppColors.white),
      scaffoldBackgroundColor: AppColors.black,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.grey200,
        selectionColor: AppColors.white,
        selectionHandleColor: AppColors.white,
      ),
      cardTheme: CardTheme(
        color: AppColors.grey800,
        elevation: 0,
        margin: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(GlobalConstants.radiusM),
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
      ),
      appBarTheme: const AppBarTheme(
        surfaceTintColor: AppColors.black,
        backgroundColor: AppColors.black,
        elevation: 0,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppColors.white),
        scrolledUnderElevation: 0,
        titleTextStyle: TextStyle(
          color: AppColors.white,
          fontFamily: 'WorkSans',
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
      ),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        tileColor: AppColors.grey800,
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
          color: AppColors.grey300,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.grey300,
        thickness: 0.5,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.primary,
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
        fillColor: AppColors.grey800,
        counterStyle: AppTextTheme.lightTextTheme.bodySmall
            ?.copyWith(color: AppColors.white),
        prefixStyle: AppTextTheme.darkTextTheme.bodyLarge
            ?.copyWith(color: AppColors.grey300),
        suffixStyle: AppTextTheme.darkTextTheme.bodyLarge
            ?.copyWith(color: AppColors.grey300),
        labelStyle: AppTextTheme.darkTextTheme.bodyLarge
            ?.copyWith(color: AppColors.white),
        hintStyle: AppTextTheme.darkTextTheme.bodyLarge
            ?.copyWith(color: AppColors.white),
        errorStyle: AppTextTheme.darkTextTheme.bodySmall
            ?.copyWith(color: AppColors.error),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GlobalConstants.radiusM),
          borderSide: const BorderSide(color: AppColors.grey300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GlobalConstants.radiusM),
          borderSide: const BorderSide(color: AppColors.grey300, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GlobalConstants.radiusM),
          borderSide: const BorderSide(color: AppColors.error, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GlobalConstants.radiusM),
          borderSide: const BorderSide(color: AppColors.error, width: 1.0),
        ),
        errorMaxLines: 2,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        menuStyle: MenuStyle(
          surfaceTintColor: WidgetStateProperty.all(AppColors.grey800),
          backgroundColor: WidgetStateProperty.all(AppColors.grey800),
          elevation: WidgetStateProperty.all(4),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(GlobalConstants.radiusM),
            ),
          ),
        ),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: AppColors.grey800,
        elevation: 16,
        surfaceTintColor: AppColors.grey800,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          overlayColor: AppColors.grey300,
          foregroundColor: AppColors.primary,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      dialogTheme: const DialogTheme(
        backgroundColor: AppColors.grey800,
        elevation: 16,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(GlobalConstants.radiusM)),
        ),
      ),
      expansionTileTheme: const ExpansionTileThemeData(
        iconColor: AppColors.white,
        textColor: AppColors.white,
        collapsedIconColor: AppColors.white,
        collapsedTextColor: AppColors.white,
        backgroundColor: AppColors.grey800,
        collapsedBackgroundColor: AppColors.grey800,
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: AppColors.grey800,
        surfaceTintColor: AppColors.grey800,
        headerBackgroundColor: AppColors.primary,
        headerForegroundColor: AppColors.white,
        dayBackgroundColor:
            WidgetStateProperty.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return AppColors.grey800; // Modificato per il tema scuro
        }),
        dayForegroundColor:
            WidgetStateProperty.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.white;
          }
          return AppColors.grey800; // Modificato per il tema scuro
        }),
        yearForegroundColor:
            WidgetStateProperty.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.white;
          }
          return AppColors.grey800; // Modificato per il tema scuro
        }),
        todayForegroundColor: const WidgetStatePropertyAll(AppColors.primary),
        todayBackgroundColor:
            WidgetStatePropertyAll(AppColors.primary.withAlpha(10)),
      ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: AppColors.grey800,
        hourMinuteColor: AppColors.primary,
        hourMinuteTextColor: AppColors.white,
        dialHandColor: AppColors.primary,
        dialBackgroundColor: AppColors.grey800,
        dialTextColor: AppColors.white,
      ),
      searchViewTheme: SearchViewThemeData(
        backgroundColor: AppColors.grey800,
        surfaceTintColor: AppColors.grey800,
        dividerColor: AppColors.grey300,
        headerTextStyle: AppTextTheme.darkTextTheme.labelMedium,
        headerHintStyle: AppTextTheme.darkTextTheme.labelMedium
            ?.copyWith(color: AppColors.grey300),
      ),
      colorScheme: ColorScheme.dark(
        surface: AppColors.black,
        surfaceTint: AppColors.black,
        surfaceBright: AppColors.grey800,
        surfaceContainer: AppColors.grey800,
        onSurface: AppColors.white,
      ),
    );
  }
}
