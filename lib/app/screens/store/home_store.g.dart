// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  Computed<bool>? _$bluetoothOnComputed;

  @override
  bool get bluetoothOn =>
      (_$bluetoothOnComputed ??= Computed<bool>(() => super.bluetoothOn,
              name: '_HomeStore.bluetoothOn'))
          .value;

  late final _$_bluetoothOnAtom =
      Atom(name: '_HomeStore._bluetoothOn', context: context);

  @override
  bool get _bluetoothOn {
    _$_bluetoothOnAtom.reportRead();
    return super._bluetoothOn;
  }

  @override
  set _bluetoothOn(bool value) {
    _$_bluetoothOnAtom.reportWrite(value, super._bluetoothOn, () {
      super._bluetoothOn = value;
    });
  }

  late final _$_HomeStoreActionController =
      ActionController(name: '_HomeStore', context: context);

  @override
  void setBluetoothStatus(bool value) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setBluetoothStatus');
    try {
      return super.setBluetoothStatus(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bluetoothOn: ${bluetoothOn}
    ''';
  }
}
