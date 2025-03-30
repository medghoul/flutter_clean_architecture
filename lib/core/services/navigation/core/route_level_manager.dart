part of '../navigation.dart';

class RouteLevelManager with NavigationLogger {
  static final RouteLevelManager _instance = RouteLevelManager._internal();
  factory RouteLevelManager() => _instance;
  RouteLevelManager._internal();

  static RouteLevel _currentLevel = RouteLevel.root;
  static bool _updateCancelled = false;

  static RouteLevel get currentLevel => _currentLevel;

  static void cancelUpdates() => _updateCancelled = true;
  static void resumeUpdates() => _updateCancelled = false;

  static void updateLevel(RouteLevel newLevel, {bool force = false}) {
    if (_updateCancelled && !force) {
      _instance.logger.d('Route level update is cancelled!');
      return;
    }
    _instance.logger.d('Updating route level: $_currentLevel --> $newLevel');
    _currentLevel = newLevel;
  }

  static void decrementLevel() {
    if (_currentLevel != RouteLevel.root) {
      _currentLevel = RouteLevel.values[_currentLevel.index - 1];
    }
  }

  static void resetToRoot() {
    _currentLevel = RouteLevel.root;
  }
}