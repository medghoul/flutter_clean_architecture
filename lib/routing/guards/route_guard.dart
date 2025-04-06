import 'package:clean_architecture/core/services/shared_preferences/shared_prefs_service.dart';
import 'package:clean_architecture/core/structures/enums.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Provides authentication and authorization checks for routes.
///
/// This class is responsible for:
/// - Checking if a user is authenticated
/// - Redirecting unauthenticated users to login
/// - Handling route-specific permissions
class RouteGuard {
  final SharedPreferencesService _prefsService;

  RouteGuard(this._prefsService);

  /// Checks if the user is authenticated by verifying token existence
  bool get isAuthenticated {
    final token = _prefsService.getValue<String>(PrefsKeys.token);
    return token != null && token.isNotEmpty;
  }

  /// Main redirect logic for protected routes
  String? redirect(BuildContext context, GoRouterState state) {
    // Get the current path
    final path = state.matchedLocation;
    
    // Public routes that don't require authentication
    final publicRoutes = [
      '/intro',
      '/intro/access',
      '/intro/onboarding',
      '/intro/access/signIn',
      '/intro/access/signUp',
      '/intro/access/forgotPassword',
    ];
    
    // Check if the current route is public
    final isPublicRoute = publicRoutes.any((route) => path.startsWith(route));
    
    // If authenticated and trying to access login/signup pages, redirect to home
    if (isAuthenticated && isPublicRoute) {
      // Special case: allow access to signup confirmation even when authenticated
      if (path.contains('signUpConfirmation')) {
        return null;
      }
      return '/home';
    }
    
    // If not authenticated and trying to access protected routes, redirect to login
    if (!isAuthenticated && !isPublicRoute) {
      return '/intro';
    }
    
    // Allow the navigation to proceed
    return null;
  }
  
  /// Checks if user has permission for a specific feature
  bool hasPermission(String feature) {
    // Get user permissions from preferences
    final permissions = _prefsService.getValue<List<String>>(
      PrefsKeys.permissions,
      <String>[],
    );
    
    // Check if the feature is in the permissions list
    return permissions?.contains(feature) ?? false;
  }
} 