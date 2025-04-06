import 'dart:ui';

import 'package:clean_architecture/core/dependency_injection/dependency_injection.dart';
import 'package:clean_architecture/core/services/shared_preferences/shared_prefs_service.dart';
import 'package:clean_architecture/core/structures/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.dart';
part 'app_cubit.freezed.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.initial());

  bool isDark = true;

  String currentLangCode = 'en';

//Theme Mode
  Future<void> changeAppThemeMode({bool? sharedMode}) async {
    if (sharedMode != null) {
      isDark = sharedMode;
      emit(AppState.themeChangeMode(isDark: isDark));
    } else {
      isDark = !isDark;
      await di<SharedPreferencesService>().setValue<bool>(
        PrefsKeys.theme,
        isDark,
      );
      emit(AppState.themeChangeMode(isDark: isDark));
    }
  }

//Language Change
  void getSavedLanguage() {
    final result = di<SharedPreferencesService>().getValue<String>(
      PrefsKeys.locale,
    );

    currentLangCode = result!;

    emit(AppState.languageChange(locale: Locale(currentLangCode)));
  }

  Future<void> _changeLang(String langCode) async {
    await di<SharedPreferencesService>().setValue<String>(
      PrefsKeys.locale,
      langCode,
    );
    currentLangCode = langCode;
    emit(AppState.languageChange(locale: Locale(currentLangCode)));
  }

  void toItalian() => _changeLang('it');

  void toEnglish() => _changeLang('en');
}
