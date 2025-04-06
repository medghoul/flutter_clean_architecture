import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// A widget that animates its child with a fade-in and slide-down effect.
///
/// Parameters:
/// - [child]: The widget to be animated
/// - [duration]: Duration of the animation in milliseconds
class FCAFadeInDown extends StatelessWidget {
  const FCAFadeInDown({
    required this.child,
    required this.duration,
    super.key,
  });

  final Widget child;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        FadeEffect(
          delay: 300.milliseconds,
          duration: duration.milliseconds,
        ),
        SlideEffect(
          begin: Offset(0, -0.5),
          end: Offset.zero,
          delay: 300.milliseconds,
          duration: duration.milliseconds,
        ),
      ],
      child: child,
    );
  }
}

/// A widget that animates its child with a fade-in and slide-up effect.
///
/// Parameters:
/// - [child]: The widget to be animated
/// - [duration]: Duration of the animation in milliseconds
class FCAFadeInUp extends StatelessWidget {
  const FCAFadeInUp({
    required this.child,
    required this.duration,
    super.key,
  });

  final Widget child;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        FadeEffect(
          delay: 300.milliseconds,
          duration: duration.milliseconds,
        ),
        SlideEffect(
          begin: Offset(0, 0.5),
          end: Offset.zero,
          delay: 300.milliseconds,
          duration: duration.milliseconds,
        ),
      ],
      child: child,
    );
  }
}

/// A widget that animates its child with a fade-in and slide-left effect.
///
/// Parameters:
/// - [child]: The widget to be animated
/// - [duration]: Duration of the animation in milliseconds
class FCAFadeInLeft extends StatelessWidget {
  const FCAFadeInLeft({
    required this.child,
    required this.duration,
    super.key,
  });

  final Widget child;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        FadeEffect(
          delay: 300.milliseconds,
          duration: duration.milliseconds,
        ),
        SlideEffect(
          begin: Offset(-0.5, 0),
          end: Offset.zero,
          delay: 300.milliseconds,
          duration: duration.milliseconds,
        ),
      ],
      child: child,
    );
  }
}

/// A widget that animates its child with a fade-in and slide-right effect.
///
/// Parameters:
/// - [child]: The widget to be animated
/// - [duration]: Duration of the animation in milliseconds
class FCAFadeInRight extends StatelessWidget {
  const FCAFadeInRight({
    required this.child,
    required this.duration,
    super.key,
  });

  final Widget child;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        FadeEffect(
          delay: 300.milliseconds,
          duration: duration.milliseconds,
        ),
        SlideEffect(
          begin: Offset(0.5, 0),
          end: Offset.zero,
          delay: 300.milliseconds,
          duration: duration.milliseconds,
        ),
      ],
      child: child,
    );
  }
}
