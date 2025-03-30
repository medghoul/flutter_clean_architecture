part of '../navigation.dart';

enum RouteLevel { root, primary, secondary, dialog }

abstract class BaseRoute {
  String get path;
  String get name;
  RouteLevel get level;
  
  const BaseRoute();
  
  /// Helper to check if this is a root level route
  bool get isRoot => level == RouteLevel.root;
  
  /// Helper to check if this route requires a parent route
  bool get isNested => !path.startsWith('/');
  
  /// Get the full path including parent if needed
  String getFullPath([String? parentPath]) {
    if (!isNested || parentPath == null) return path;
    return '$parentPath/$path'.replaceAll('//', '/');
  }
}
