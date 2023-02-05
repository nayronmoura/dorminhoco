// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'per_time_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PerTimeStore on _PerTimeStore, Store {
  Computed<bool>? _$isButtonDisabledComputed;

  @override
  bool get isButtonDisabled => (_$isButtonDisabledComputed ??= Computed<bool>(
          () => super.isButtonDisabled,
          name: '_PerTimeStore.isButtonDisabled'))
      .value;
  Computed<bool>? _$isNotDisabledComputed;

  @override
  bool get isNotDisabled =>
      (_$isNotDisabledComputed ??= Computed<bool>(() => super.isNotDisabled,
              name: '_PerTimeStore.isNotDisabled'))
          .value;

  late final _$timeAtom = Atom(name: '_PerTimeStore.time', context: context);

  @override
  Date get time {
    _$timeAtom.reportRead();
    return super.time;
  }

  @override
  set time(Date value) {
    _$timeAtom.reportWrite(value, super.time, () {
      super.time = value;
    });
  }

  late final _$_isButtonDisabledAtom =
      Atom(name: '_PerTimeStore._isButtonDisabled', context: context);

  @override
  bool get _isButtonDisabled {
    _$_isButtonDisabledAtom.reportRead();
    return super._isButtonDisabled;
  }

  @override
  set _isButtonDisabled(bool value) {
    _$_isButtonDisabledAtom.reportWrite(value, super._isButtonDisabled, () {
      super._isButtonDisabled = value;
    });
  }

  late final _$_PerTimeStoreActionController =
      ActionController(name: '_PerTimeStore', context: context);

  @override
  void addTime(int i) {
    final _$actionInfo = _$_PerTimeStoreActionController.startAction(
        name: '_PerTimeStore.addTime');
    try {
      return super.addTime(i);
    } finally {
      _$_PerTimeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTime(int i) {
    final _$actionInfo = _$_PerTimeStoreActionController.startAction(
        name: '_PerTimeStore.removeTime');
    try {
      return super.removeTime(i);
    } finally {
      _$_PerTimeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void buttonVisible(bool value) {
    final _$actionInfo = _$_PerTimeStoreActionController.startAction(
        name: '_PerTimeStore.buttonVisible');
    try {
      return super.buttonVisible(value);
    } finally {
      _$_PerTimeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void start() {
    final _$actionInfo = _$_PerTimeStoreActionController.startAction(
        name: '_PerTimeStore.start');
    try {
      return super.start();
    } finally {
      _$_PerTimeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void pause() {
    final _$actionInfo = _$_PerTimeStoreActionController.startAction(
        name: '_PerTimeStore.pause');
    try {
      return super.pause();
    } finally {
      _$_PerTimeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stop() {
    final _$actionInfo =
        _$_PerTimeStoreActionController.startAction(name: '_PerTimeStore.stop');
    try {
      return super.stop();
    } finally {
      _$_PerTimeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMinute(int value) {
    final _$actionInfo = _$_PerTimeStoreActionController.startAction(
        name: '_PerTimeStore.setMinute');
    try {
      return super.setMinute(value);
    } finally {
      _$_PerTimeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHour(int value) {
    final _$actionInfo = _$_PerTimeStoreActionController.startAction(
        name: '_PerTimeStore.setHour');
    try {
      return super.setHour(value);
    } finally {
      _$_PerTimeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSecond(int value) {
    final _$actionInfo = _$_PerTimeStoreActionController.startAction(
        name: '_PerTimeStore.setSecond');
    try {
      return super.setSecond(value);
    } finally {
      _$_PerTimeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
time: ${time},
isButtonDisabled: ${isButtonDisabled},
isNotDisabled: ${isNotDisabled}
    ''';
  }
}
