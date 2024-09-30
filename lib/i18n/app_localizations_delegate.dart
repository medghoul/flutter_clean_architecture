import 'package:clean_architecture/i18n/app_localization.dart';
import 'package:flutter/material.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return [
      'en',
      'es',
      'it',
      'fr',
      'de',
    ].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);

    await localizations.load();
    
    return localizations;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}