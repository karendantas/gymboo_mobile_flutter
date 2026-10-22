import 'dart:async';
import 'dart:math';

import 'package:sensors_plus/sensors_plus.dart';

class JumpDetector {
  JumpDetector({
    this.threshold = 9.0, // m/s², calibre no aparelho real
    this.cooldown = const Duration(milliseconds: 300),
  });

  final double threshold;
  final Duration cooldown;

  StreamSubscription<UserAccelerometerEvent>? _sub;
  DateTime _last = DateTime.fromMillisecondsSinceEpoch(0);

  void start(void Function() onJump) {
    _sub =
        userAccelerometerEventStream(
          samplingPeriod:
              SensorInterval.gameInterval, // padrão (200 ms) é lento demais
        ).listen((e) {
          final magnitude = sqrt(e.x * e.x + e.y * e.y + e.z * e.z);
          final now = DateTime.now();
          if (magnitude > threshold && now.difference(_last) > cooldown) {
            _last = now;
            onJump();
          }
        });
  }

  void stop() {
    _sub?.cancel();
    _sub = null;
  }
}
