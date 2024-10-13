import 'package:clean_architecture/core/enums/text_animation_type.dart';
import 'package:clean_architecture/core/resources/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TextAnimation extends StatelessWidget {
  final Text text;
  final TextAnimationType animationType;
  final int duration;
  final int delay;

  const TextAnimation({
    super.key,
    required this.text,
    this.animationType = TextAnimationType.fadeIn,
    this.duration = 500,
    this.delay = 300,
  });

  @override
  Widget build(BuildContext context) {
    switch (animationType) {
      case TextAnimationType.fadeIn:
        return text
            .animate()
            .fadeIn(duration: duration.milliseconds, delay: delay.milliseconds);

      case TextAnimationType.simpleTypewriter:
        return text
            .animate()
            .fadeIn(duration: 300.milliseconds, delay: delay.milliseconds)
            .shimmer(duration: duration.milliseconds, color: AppColors.white)
            .custom(
              duration: duration.milliseconds,
              builder: (context, value, child) => ClipRect(
                child: Align(
                  alignment: Alignment.centerLeft,
                  widthFactor: value,
                  child: child,
                ),
              ),
            );

      case TextAnimationType.scale:
        return text
            .animate()
            .scale(duration: duration.milliseconds, delay: delay.milliseconds)
            .fade(duration: duration.milliseconds, delay: delay.milliseconds);

      case TextAnimationType.wave:
        return text
            .animate()
            .fadeIn(duration: 500.milliseconds, delay: delay.milliseconds)
            .shimmer(duration: 1000.milliseconds, color: AppColors.white)
            .custom(
              duration: duration.milliseconds,
              builder: (context, value, child) {
                return Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, 4.0 * value)
                    ..rotateZ(0.02 * value),
                  child: child,
                );
              },
            );
    }
  }
}
