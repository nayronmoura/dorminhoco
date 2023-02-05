import 'package:audio_session/audio_session.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'notification_service.dart';

class BluetoothService {
  final FlutterBluePlus flutterBlue;
  final NotificationService notificationService;

  const BluetoothService(
      {required this.flutterBlue, required this.notificationService});

  Stream<bool> checkBluetooth() async* {
    yield* flutterBlue.state.asyncMap((event) => event == BluetoothState.on);
  }

  void disableSong() async {
    try {
      if (await flutterBlue.isOn) {
        flutterBlue.turnOff();
      }
      AudioSession session = await AudioSession.instance;
      session.setActive(false);
    } catch (e) {
      rethrow;
    }
  }
}