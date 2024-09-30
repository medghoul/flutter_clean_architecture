import 'package:clean_architecture/i18n/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension ContextExtension on BuildContext {

  //Localization
  String translate(String key) {
    return AppLocalizations.of(this).translate(key);
  }

  //Theme
  ThemeData get theme => Theme.of(this);

  //TextTheme
  TextTheme get textTheme => theme.textTheme;

  //ColorScheme
  ColorScheme get colorScheme => theme.colorScheme;

  //Router
  GoRouter get router => GoRouter.of(this);

  //Navigator
  NavigatorState get navigator => Navigator.of(this);

}
