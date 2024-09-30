import 'dart:async';
import 'package:flutter/foundation.dart';

class Debouncer {
  final int millisecondi;
  Timer? _timer;

  Debouncer({required this.millisecondi});

  void run(VoidCallback azione) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: millisecondi), azione);
  }

  void dispose() {
    _timer?.cancel();
  }
}