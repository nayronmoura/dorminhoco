import 'dart:async';

import 'package:mobx/mobx.dart';

import '../../common/Date.dart';
import '../../common/bluetooth_service.dart';

part 'per_time_store.g.dart';

class PerTimeStore = _PerTimeStore with _$PerTimeStore;

abstract class _PerTimeStore with Store {
  final BluetoothService manageService;

  _PerTimeStore({
    required this.manageService,
  });

  Timer? _timer;

  @observable
  Date time = Date(minute: 0, hour: 0, second: 0);

  @observable
  bool _isButtonDisabled = false;

  @action
  void addTime(int i) {
    time.add(i);
    time = time.copyWith();
  }

  @action
  void removeTime(int i) {
    time.remove(i);
    time = time.copyWith();
  }

  @action
  void buttonVisible(bool value) => _isButtonDisabled = value;

  @computed
  bool get isButtonDisabled => _isButtonDisabled;

  @computed
  bool get isNotDisabled => !_isButtonDisabled;

  @action
  void start() {
    if (time.hour == 0 && time.minute == 0 && time.second == 0) {
      buttonVisible(false);
      return;
    } else if (_timer != null) {
      return;
    } else {
      buttonVisible(true);
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (time.hour == 0 && time.minute == 0 && time.second == 0) {
          buttonVisible(false);
          _DisableSong();
          timer.cancel();
          _timer= null;
        }
        removeTime(1);
      });
    }
  }

  void _DisableSong() async {
    manageService.disableSong();
  }

  @action
  void pause() {
    buttonVisible(false);
    if (_timer != null) _timer!.cancel();
    _timer=null;
  }

  @action
  void stop() {
    buttonVisible(false);
    if (_timer != null) _timer!.cancel();
    _timer=null;
    time = Date(minute: 0, hour: 0, second: 0);
    _DisableSong();
  }

  @action
  void setMinute(int value) =>
      time = Date(minute: value, hour: time.hour, second: time.second);

  @action
  void setHour(int value) =>
      time = Date(minute: time.minute, hour: value, second: time.second);

  @action
  void setSecond(int value) =>
      time = Date(minute: time.minute, hour: time.hour, second: value);
}
