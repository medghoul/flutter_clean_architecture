import 'dart:async';
import 'package:flutter/widgets.dart';

class Debouncer {
  final int millisecondi;
  Timer? _timer;

  Debouncer({required this.millisecondi});

  void run(dynamic action, {bool immediate = false}) {
    if (immediate) {
      _executeAction(action);
      return;
    }

    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: millisecondi), () => _executeAction(action));
  }

  void _executeAction(dynamic action) {
    if (action is VoidCallback) {
      action();
    } else if (action is Widget Function()) {
      action();
    }
  }

  void dispose() {
    _timer?.cancel();
  }
}
