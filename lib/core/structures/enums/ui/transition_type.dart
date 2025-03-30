part of 'index.dart';

/// Defines the type of transition animation to be used.
///
/// Available transitions:
/// - [fade]: Fades the page in/out
/// - [slideRight]: Slides the page from right to left
/// - [slideUp]: Slides the page from bottom to top
/// - [scale]: Scales the page in/out
/// - [custom]: Combines multiple animations
enum TransitionType {
  fade,
  slideRight,
  slideUp,
  scale,
  custom
}