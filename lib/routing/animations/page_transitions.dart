import 'package:clean_architecture/core/structures/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

/// Provides standardized page and dialog transitions for the app.
///
/// This class contains two main static methods:
/// - [page]: For regular page transitions using go_router
/// - [dialog]: For fullscreen dialog transitions
///
/// Uses flutter_animate for smooth, composable animations.
class PageTransitions {
  /// Creates a custom transition page for navigation.
  ///
  /// Parameters:
  /// - [name]: The name of the page for routing
  /// - [key]: LocalKey for the page
  /// - [child]: The widget to be animated
  /// - [type]: The type of transition animation (defaults to fade)
  /// - [duration]: Duration of the animation (defaults to 300ms)
  static CustomTransitionPage<T> page<T>({
    required String name,
    required LocalKey key,
    required Widget child,
    TransitionType type = TransitionType.fade,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return CustomTransitionPage<T>(
      key: key,
      name: name,
      child: child,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (type) {
          case TransitionType.fade:
            return child.animate().fade(duration: duration);
            
          case TransitionType.slideRight:
            return child.animate().slideX(
              begin: 1,
              duration: duration,
              curve: Curves.easeInOut,
            );
            
          case TransitionType.slideUp:
            return child.animate().slideY(
              begin: 1,
              duration: duration,
              curve: Curves.easeInOut,
            );
            
          case TransitionType.scale:
            return child.animate().scale(
              duration: duration,
              curve: Curves.easeInOut,
            );
            
          case TransitionType.custom:
            return child.animate()
              .fade(duration: duration * 0.5)
              .scale(delay: duration * 0.2)
              .slideY(begin: 0.2, curve: Curves.easeInOut);
        }
      },
    );
  }

  /// Creates animated transitions for fullscreen dialogs.
  ///
  /// Parameters:
  /// - [child]: The widget to be animated
  /// - [type]: The type of transition animation (defaults to slideUp)
  /// - [duration]: Duration of the animation (defaults to 300ms)
  static Widget dialog({
    required Widget child,
    TransitionType type = TransitionType.slideUp,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    switch (type) {
      case TransitionType.fade:
        return child.animate().fade(duration: duration);
        
      case TransitionType.slideUp:
        return child.animate().slideY(
          begin: 1,
          duration: duration,
          curve: Curves.easeOutExpo,
        );
        
      case TransitionType.scale:
        return child.animate()
          .scale(
            begin: const Offset(0.8, 0.8),
            duration: duration,
            curve: Curves.easeOut,
          )
          .fade();
        
      default:
        return child.animate().fade(duration: duration);
    }
  }
}