part of 'navigation.dart';

class NavigationService with NavigationLogger {
  static final NavigationService _instance = NavigationService._internal();
  factory NavigationService() => _instance;
  NavigationService._internal();

  static RouteLevel get currentLevel => RouteLevelManager.currentLevel;
  static void cancelRouteUpdates() => RouteLevelManager.cancelUpdates();
  static void resumeRouteUpdates() => RouteLevelManager.resumeUpdates();
  static void updateRouteLevel(RouteLevel level, {bool force = false}) => 
      RouteLevelManager.updateLevel(level, force: force);

  static void navigateTo(BuildContext context, BaseRoute route, {Object? extra}) {
    final navigationType = NavigationAction.determineNavigationType(
      RouteLevelManager.currentLevel,
      route
    );
    
    RouteLevelManager.resumeUpdates();
    
    final path = PathBuilder.buildPath(
      context,
      route,
      RouteLevelManager.currentLevel
    );
    
    NavigationAction.executeNavigation(
      context,
      navigationType,
      path,
      route.name,
      extra: extra
    );

    RouteLevelManager.updateLevel(route.level);
  }

  static void goBack(BuildContext context) {
    RouteLevelManager.resumeUpdates();
    
    if (RouteLevelManager.currentLevel == RouteLevel.dialog || 
        RouteLevelManager.currentLevel.index > RouteLevel.root.index) {
      context.pop();
      
      if (RouteLevelManager.currentLevel != RouteLevel.dialog && 
          RouteLevelManager.currentLevel != RouteLevel.root) {
        RouteLevelManager.decrementLevel();
      } else {
        RouteLevelManager.resetToRoot();
      }
    }
  }

  static void logout(BuildContext context, BaseRoute route) {
    RouteLevelManager.resumeUpdates();
    context.replace(route.path);
  }
}