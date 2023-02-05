

import 'package:mobx/mobx.dart';

import '../../common/bluetooth_service.dart';

part'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  late final BluetoothService _manageService;

  _HomeStore({required BluetoothService manageService}){
    _manageService = manageService;
    _manageService.checkBluetooth().listen((event) {
      setBluetoothStatus(event);
    });
  }

  @observable
  bool _bluetoothOn = false;

  @computed
  bool get bluetoothOn => _bluetoothOn;

  @action
  void setBluetoothStatus(bool value) => _bluetoothOn = value;
}