import 'package:flutter/widgets.dart';

class FCAStep {
  final String title;
  final String? subtitle;
  final Widget? content;
  final bool isCompleted;
  final bool inProgress;
  final bool inError;

  FCAStep({
    required this.title,
    this.subtitle,
    this.content,
    this.isCompleted = false,
    this.inProgress = false,
    this.inError = false,
  });

  FCAStep copyWith({
    String? title,
    String? subtitle,
    Widget? subtitleWidget,
    Widget? content,
    bool? isCompleted,
    bool? inProgress,
    bool? inError,
  }) {
    return FCAStep(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      content: content ?? this.content,
      isCompleted: isCompleted ?? this.isCompleted,
      inProgress: inProgress ?? this.inProgress,
      inError: inError ?? this.inError,
    );
  }
}
