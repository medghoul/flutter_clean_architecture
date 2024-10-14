import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FadeInDown extends StatelessWidget {
  const FadeInDown({
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
          begin: const Offset(0, -0.5),
          end: Offset.zero,
          delay: 300.milliseconds,
          duration: duration.milliseconds,
        ),
      ],
      child: child,
    );
  }
}

class FadeInUp extends StatelessWidget {
  const FadeInUp({
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
          begin: const Offset(0, 0.5),
          end: Offset.zero,
          delay: 300.milliseconds,
          duration: duration.milliseconds,
        ),
      ],
      child: child,
    );
  }
}

class FadeInLeft extends StatelessWidget {
  const FadeInLeft({
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
          begin: const Offset(-0.5, 0),
          end: Offset.zero,
          delay: 300.milliseconds,
          duration: duration.milliseconds,
        ),
      ],
      child: child,
    );
  }
}

class FadeInRight extends StatelessWidget {
  const FadeInRight({
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
          begin: const Offset(0.5, 0),
          end: Offset.zero,
          delay: 300.milliseconds,
          duration: duration.milliseconds,
        ),
      ],
      child: child,
    );
  }
}
