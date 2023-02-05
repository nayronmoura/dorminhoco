import 'dart:async';

import 'package:dorminhoco/app/common/batery_service.dart';
import 'package:mobx/mobx.dart';

import '../../common/bluetooth_service.dart';

part 'per_batery_store.g.dart';

class PerBateryStore = _PerBateryStore with _$PerBateryStore;

abstract class _PerBateryStore with Store {
  Timer? _timer;
  final Battery batery = Battery();

  final BluetoothService bluetoothService;

  _PerBateryStore({required this.bluetoothService}) {
    batery.bateryLevelStream().listen(
      (event) {
        setMaxBateryLevel(event);
      },
    );
  }

  @observable
  bool _running = false;

  @computed
  bool get running => _running;

  @observable
  int _maxBateryLevel = 1;

  @computed
  int get getMaxBateryLevel => _maxBateryLevel;

  @action
  void setMaxBateryLevel(int value) => _maxBateryLevel = value;

  @action
  void setRunning(bool value) => _running = value;

  @observable
  int _bateryLevel = 0;

  @computed
  int get bateryLevel => _bateryLevel;

  @action
  void setBateryLevel(int value) => _bateryLevel = value;

  @action
  void start() async {
    setRunning(true);
    int batteryLevel = await batery.getBatteryLevel();
    if (_bateryLevel >= batteryLevel) {
      setRunning(false);
      setMaxBateryLevel(batteryLevel);
      throw "O nível de bateria não pode ser maior que o atual";
    }
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) async {
        int batteryLevel = await batery.getBatteryLevel();
        setBateryLevel(batteryLevel);
        if (batteryLevel == _maxBateryLevel) {
          bluetoothService.disableSong();
          timer.cancel();
          setRunning(false);
        }
      },
    );

  }

  @action
  stop() {
    setRunning(false);
  }
}
