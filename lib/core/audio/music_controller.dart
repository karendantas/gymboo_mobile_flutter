import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MusicController extends Notifier<bool> {
  final _player = AudioPlayer();
  late final AppLifecycleListener _lifecycle;

  bool _wantsToPlay = true;

  @override
  bool build() {
    _player.setReleaseMode(ReleaseMode.loop);

    _lifecycle = AppLifecycleListener(
      onStateChange: (s) {
        switch (s) {
          case AppLifecycleState.resumed:
            if (_wantsToPlay) _player.resume();
          case AppLifecycleState.hidden:
          case AppLifecycleState.paused:
          case AppLifecycleState.detached:
            _player.pause();
          case AppLifecycleState.inactive:
            break;
        }
      },
    );
    ref.onDispose(() {
      _lifecycle.dispose();
      _player.dispose();
    });
    return false;
  }

  Future<void> playBackgroundMusic() async {
    _wantsToPlay = true;

    if (_player.state == PlayerState.playing) return;
    await _player.play(
      AssetSource('audio/theme_song.mp3'),
      volume: state ? 0.0 : 0.5,
    );
  }

  Future<void> stopBackgroundMusic() async {
    _wantsToPlay = false;
    await _player.pause();
  }

  Future<void> toggleMute() async {
    state = !state;
    await _player.setVolume(state ? 0.0 : 0.5);
  }
}

final musicControllerProvider = NotifierProvider<MusicController, bool>(
  MusicController.new,
);
