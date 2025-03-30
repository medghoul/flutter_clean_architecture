part of '../navigation.dart';

class PathBuilder with NavigationLogger {
  static String buildPath(BuildContext context, BaseRoute route, RouteLevel currentLevel) {
    if (route.level == RouteLevel.root || route.path.startsWith('/')) {
      if (kDebugMode) print('[PathBuilder] Root or absolute path: ${route.path}');
      return route.path;
    }
    
    if (route.level.index > currentLevel.index) {
      if (kDebugMode) print('[PathBuilder] Route level is higher than current level: ${route.path}');
      return route.path;
    }
    
    return _buildFullPathWithParent(context, route);
  }

  static String _buildFullPathWithParent(BuildContext context, BaseRoute route) {
    final currentLocation = GoRouterState.of(context).matchedLocation;
    final segments = currentLocation.split('/').where((s) => s.isNotEmpty).toList();
    if (kDebugMode) print('[PathBuilder] Current location: $currentLocation');
    if (kDebugMode) print('[PathBuilder] Segments: $segments');
    return segments.length > 1 
        ? '/${segments.first}/${route.path}'
        : '/${segments.first}/${route.path}';
  }
}