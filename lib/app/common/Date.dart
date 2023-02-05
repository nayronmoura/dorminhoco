class Date {
  late int _minute;
  late int _hour;
  late int _second;

  Date({required int minute, required int hour, required int second}) {
    _minute = minute;
    _hour = hour;
    _second = second;
  }

  setMinute(int value) => _minute = value;

  setHour(int value) => _hour = value;

  setSecond(int value) => _second = value;

  int get minute => _minute;

  int get hour => _hour;

  int get second => _second;

  void add(int i) {
    _second += i;
    if (_second >= 60) {
      _second = 0;
      _minute++;
    }
    if (_minute >= 60) {
      _minute = 0;
      _hour++;
    }
    if (_hour >= 24) {
      _hour = 0;
    }
  }

  void remove(int i) {
    if(_second ==0 && _minute == 0 && _hour == 0){
      return;
    }
    _second -= i;
    if (_second < 0) {
      _second = 59;
      _minute--;
    }
    if (_minute < 0) {
      _minute = 59;
      _hour--;
    }
  }

  Date copyWith([int? minute, int? hour, int? second]) {
    return Date(
        minute: minute ?? _minute,
        hour: hour ?? _hour,
        second: second ?? _second);
  }

  @override
  toString() => "$_hour:$_minute:$_second";
}
