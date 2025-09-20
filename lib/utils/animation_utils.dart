import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimationUtils {
  static const Duration defaultDuration = Duration(milliseconds: 300);
  static const Duration scrollDuration = Duration(milliseconds: 500);
  static const Duration fadeInDuration = Duration(milliseconds: 600);
  static const Duration slideDuration = Duration(milliseconds: 500);

  static const Curve defaultCurve = Curves.easeInOut;
  static const Curve slideCurve = Curves.easeOutCubic;
  static const Curve elasticCurve = Curves.elasticOut;

  static Widget fadeInSlideY({
    required Widget child,
    Duration delay = Duration.zero,
    Duration duration = fadeInDuration,
    double begin = 0.3,
    double end = 0.0,
    Curve curve = slideCurve,
  }) {
    return child.animate().fadeIn(delay: delay, duration: duration).slideY(
          begin: begin,
          end: end,
          duration: duration,
          curve: curve,
        );
  }

  static Widget scaleFadeIn({
    required Widget child,
    Duration delay = Duration.zero,
    Duration duration = defaultDuration,
    Offset begin = const Offset(0.8, 0.8),
    Offset end = const Offset(1, 1),
    Curve curve = elasticCurve,
  }) {
    return child.animate().fadeIn(delay: delay, duration: duration).scale(
          begin: begin,
          end: end,
          duration: duration,
          curve: curve,
        );
  }

  static Widget staggeredFadeIn({
    required Widget child,
    required int index,
    Duration baseDelay = Duration.zero,
    Duration duration = fadeInDuration,
    Duration stagger = const Duration(milliseconds: 100),
  }) {
    final delay = baseDelay + (stagger * index);
    return child.animate().fadeIn(delay: delay, duration: duration);
  }
}
