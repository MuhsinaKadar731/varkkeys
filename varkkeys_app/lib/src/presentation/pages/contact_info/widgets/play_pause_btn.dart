import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayPauseBtn extends StatefulWidget {
  final String audioUrl;

  const PlayPauseBtn({super.key, required this.audioUrl});

  @override
  State<PlayPauseBtn> createState() => _PlayPauseBtnState();
}

class _PlayPauseBtnState extends State<PlayPauseBtn> {
  late final AudioPlayer _player;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();

    _player.playerStateStream.listen((state) {
      final playing = state.playing;
      if (mounted) {
        setState(() {
          isPlaying = playing;
        });
      }
    });

    _player.setUrl(widget.audioUrl).catchError((e) {
      debugPrint('Error loading audio: $e');
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (isPlaying) {
      _player.pause();
    } else {
      _player.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isPlaying ? Icons.pause : Icons.play_arrow,
        color: Colors.green,
        size: 30,
      ),
      onPressed: _togglePlayPause,
    );
  }
}
