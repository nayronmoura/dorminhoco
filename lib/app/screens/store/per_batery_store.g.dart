// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'per_batery_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PerBateryStore on _PerBateryStore, Store {
  Computed<bool>? _$runningComputed;

  @override
  bool get running => (_$runningComputed ??=
          Computed<bool>(() => super.running, name: '_PerBateryStore.running'))
      .value;
  Computed<int>? _$bateryLevelComputed;

  @override
  int get bateryLevel =>
      (_$bateryLevelComputed ??= Computed<int>(() => super.bateryLevel,
              name: '_PerBateryStore.bateryLevel'))
          .value;

  late final _$_runningAtom =
      Atom(name: '_PerBateryStore._running', context: context);

  @override
  bool get _running {
    _$_runningAtom.reportRead();
    return super._running;
  }

  @override
  set _running(bool value) {
    _$_runningAtom.reportWrite(value, super._running, () {
      super._running = value;
    });
  }

  late final _$_bateryLevelAtom =
      Atom(name: '_PerBateryStore._bateryLevel', context: context);

  @override
  int get _bateryLevel {
    _$_bateryLevelAtom.reportRead();
    return super._bateryLevel;
  }

  @override
  set _bateryLevel(int value) {
    _$_bateryLevelAtom.reportWrite(value, super._bateryLevel, () {
      super._bateryLevel = value;
    });
  }

  late final _$_PerBateryStoreActionController =
      ActionController(name: '_PerBateryStore', context: context);

  @override
  void setRunning(bool value) {
    final _$actionInfo = _$_PerBateryStoreActionController.startAction(
        name: '_PerBateryStore.setRunning');
    try {
      return super.setRunning(value);
    } finally {
      _$_PerBateryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBateryLevel(int value) {
    final _$actionInfo = _$_PerBateryStoreActionController.startAction(
        name: '_PerBateryStore.setBateryLevel');
    try {
      return super.setBateryLevel(value);
    } finally {
      _$_PerBateryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
running: ${running},
bateryLevel: ${bateryLevel}
    ''';
  }
}
