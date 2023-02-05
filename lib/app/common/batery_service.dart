import 'dart:async';

import 'package:flutter/services.dart';

class Battery {
  static final platform = const MethodChannel('br.com.dorminhoco');

  Battery() {
    _setBatteryLevelStream();
  }

  final StreamController<int> _bateryLevelController = StreamController<int>();

  Stream<int> bateryLevelStream() => _bateryLevelController.stream;

  Future<int> getBatteryLevel() async {
    final int result = await platform.invokeMethod('getBatteryLevel');
    return result;
  }

  void _setBatteryLevelStream() async {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      getBatteryLevel().then((value) {
        _bateryLevelController.add(value);
      });
    });
  }
}
