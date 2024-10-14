import 'package:clean_architecture/i18n/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


extension ContextExtension on BuildContext {
  //Localization
  AppLocalizations get context => AppLocalizations.of(this)!;

  String translate(String key) => context.translate(key) ?? key;

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
