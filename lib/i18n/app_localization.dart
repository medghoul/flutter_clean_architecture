import 'dart:async';
import 'package:clean_architecture/core/helpers/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;
  Map<String, String> _localizedStrings = {};

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations) ??
        AppLocalizations(const Locale('en'));
  }

  Future<bool> load() async {
    await _loadLocalizedStringsFromFile();
    return true;
  }

  Future<void> _loadLocalizedStringsFromFile() async {
    debugPrint("Loading language from disk");
    String jsonString = await rootBundle.loadString('assets/locales/${locale.languageCode}.json');
    _localizedStrings = Utils.decodeJSON<String>(jsonString);
  }

  String translate(String key) {
    return _localizedStrings[key] ?? '#';
  }

  Map<String, String> get dictionary => _localizedStrings;

  static Iterable<Locale> get supportedLocales => const [
        Locale('en'),
        Locale('es'),
        Locale('it'),
        Locale('fr'),
        Locale('de')
      ];
}

extension ContextExtensions on BuildContext {
  AppLocalizations get locale => AppLocalizations.of(this);
}