import 'package:clean_architecture/core/enums/slide_direction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FCAImageFadeIn extends StatelessWidget {
  const FCAImageFadeIn({
    required this.child,
    this.duration = 500,
    this.delay = 300,
    super.key,
  });

  final Widget child;
  final int duration;
  final int delay;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        FadeEffect(
          delay: delay.milliseconds,
          duration: duration.milliseconds,
        ),
      ],
      child: child,
    );
  }
}

class FCAImageZoomIn extends StatelessWidget {
  const FCAImageZoomIn({
    required this.child,
    this.duration = 500,
    this.delay = 300,
    super.key,
  });

  final Widget child;
  final int duration;
  final int delay;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        ScaleEffect(
          delay: delay.milliseconds,
          duration: duration.milliseconds,
          begin: const Offset(0.8, 0.8),
          end: const Offset(1, 1),
        ),
        FadeEffect(
          delay: delay.milliseconds,
          duration: duration.milliseconds,
        ),
      ],
      child: child,
    );
  }
}

class FCAImageSlideIn extends StatelessWidget {
  const FCAImageSlideIn({
    required this.child,
    this.duration = 500,
    this.delay = 300,
    this.direction = SlideDirection.left,
    super.key,
  });

  final Widget child;
  final int duration;
  final int delay;
  final SlideDirection direction;

  @override
  Widget build(BuildContext context) {
    Offset begin;
    switch (direction) {
      case SlideDirection.left:
        begin = const Offset(-1, 0);
      case SlideDirection.right:
        begin = const Offset(1, 0);
      case SlideDirection.up:
        begin = const Offset(0, 1);
      case SlideDirection.down:
        begin = const Offset(0, -1);
    }

    return Animate(
      effects: [
        SlideEffect(
          begin: begin,
          end: Offset.zero,
          delay: delay.milliseconds,
          duration: duration.milliseconds,
        ),
        FadeEffect(
          delay: delay.milliseconds,
          duration: duration.milliseconds,
        ),
      ],
      child: child,
    );
  }
}

