import 'package:clean_architecture/i18n/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class _TranslationAccessor {
  final BuildContext context;
  final String prefix;

  _TranslationAccessor(this.context, [this.prefix = '']);

  String _getKey(String key) => prefix.isEmpty ? key : '$prefix.$key';

  String call(String key) => AppLocalizations.of(context).translate(_getKey(key));

  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (invocation.isGetter) {
      return _TranslationAccessor(context, _getKey(invocation.memberName.toString().split('"')[1]));
    }
    return super.noSuchMethod(invocation);
  }
}

extension ContextExtension on BuildContext {
  //Localization
  _TranslationAccessor get translate => _TranslationAccessor(this);

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
