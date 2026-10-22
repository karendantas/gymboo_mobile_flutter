import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import 'jump_detector.dart';

enum JumpRopeStatus { idle, running, finished }

class JumpRopeState {
  const JumpRopeState({
    this.status = JumpRopeStatus.idle,
    this.jumps = 0,
    this.seconds = 0,
  });

  final JumpRopeStatus status;
  final int jumps;
  final int seconds;

  JumpRopeState copyWith({JumpRopeStatus? status, int? jumps, int? seconds}) =>
      JumpRopeState(
        status: status ?? this.status,
        jumps: jumps ?? this.jumps,
        seconds: seconds ?? this.seconds,
      );
}

class JumpRopeController extends Notifier<JumpRopeState> {
  final _detector = JumpDetector();
  Timer? _timer;

  @override
  JumpRopeState build() {
    ref.onDispose(_stopAll);
    return const JumpRopeState();
  }

  void start() {
    if (state.status == JumpRopeStatus.running) return;
    state = const JumpRopeState(status: JumpRopeStatus.running);
    WakelockPlus.enable();
    _detector.start(() => state = state.copyWith(jumps: state.jumps + 1));
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => state = state.copyWith(seconds: state.seconds + 1),
    );
  }

  void finish() {
    _stopAll();
    state = state.copyWith(status: JumpRopeStatus.finished);
  }

  void _stopAll() {
    _timer?.cancel();
    _timer = null;
    _detector.stop();
    WakelockPlus.disable();
  }
}

final jumpRopeControllerProvider =
    NotifierProvider.autoDispose<JumpRopeController, JumpRopeState>(
      JumpRopeController.new,
    );
