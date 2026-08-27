import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MusicController extends Notifier<bool> {
  late final AudioPlayer _player;

  @override
  bool build() {
    _player = AudioPlayer();
    _player.setReleaseMode(ReleaseMode.loop);
    ref.onDispose(_player.dispose); 
    return false; 
  }

  Future<void> playBackgroundMusic() async {
    if (_player.state == PlayerState.playing) return; 
    await _player.play(AssetSource('audio/theme_song.mp3'), volume: state ? 0.0 : 0.5);
  }

  Future<void> toggleMute() async {
    state = !state;
    await _player.setVolume(state ? 0.0 : 0.5);
  }
}

final musicControllerProvider = NotifierProvider<MusicController, bool>(MusicController.new);