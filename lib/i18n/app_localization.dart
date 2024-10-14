import 'dart:convert' show json;

import 'package:clean_architecture/i18n/app_localizations_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  AppLocalizations(this.locale);
  final Locale locale;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  // Change this line
  static const LocalizationsDelegate<AppLocalizations> delegate = AppLocalizationsDelegate();

  late Map<String, String> _localizedStrings;

  Future<void> load() async {
    final jsonString =
        await rootBundle.loadString('assets/locales/${locale.languageCode}.json');

    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

    _localizedStrings = jsonMap.map<String, String>((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  String? translate(String key) => _localizedStrings[key];

  bool get isEnLocale => locale.languageCode == 'en';
}