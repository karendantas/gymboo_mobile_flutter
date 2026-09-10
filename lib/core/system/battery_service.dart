import 'package:battery_plus/battery_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final batteryLevelProvider = StreamProvider<int>((ref) async* {
  final battery = Battery();
  yield await battery.batteryLevel; 

  await for (final _ in battery.onBatteryStateChanged) {
    yield await battery.batteryLevel;
  }
});