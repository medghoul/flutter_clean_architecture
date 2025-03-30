part of '../navigation.dart';

class NavigationAction with NavigationLogger {
  static final NavigationAction _instance = NavigationAction._internal();
  factory NavigationAction() => _instance;
  NavigationAction._internal();

  static NavigationType determineNavigationType(RouteLevel current, BaseRoute route) {
    final level = route.level;
    if (level == RouteLevel.dialog) return NavigationType.push;
    if (level.index > current.index) return NavigationType.push;
    if ((level.index - current.index).abs() == 1) return NavigationType.pop;
    if (level.index == current.index && route.isNested) return NavigationType.pushNamed;
    return NavigationType.goNamed;
  }

  static void executeNavigation(
    BuildContext context,
    NavigationType type,
    String path,
    String name,
    {Object? extra}
  ) async {
    switch (type) {
      case NavigationType.push:
        await context.pushNamed(name, extra: extra);
        break;
      case NavigationType.pop:
        context.pop();
        break;
      case NavigationType.go:
        context.go(path, extra: extra);
        break;
      case NavigationType.goNamed:
        context.goNamed(name, extra: extra);
        break;
      case NavigationType.pushNamed:
        context.pushNamed(name, extra: extra);
        break;
    }
  }
}