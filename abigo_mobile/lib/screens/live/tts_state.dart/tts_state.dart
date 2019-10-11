import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TtsState extends ChangeNotifier {
  final FlutterTts _flutterTts = FlutterTts();
  bool _isPlaying = false;

  TtsState() {
    _flutterTts.setStartHandler(() => isPlaying = true);
    _flutterTts.setCompletionHandler(() => isPlaying = false);
    _flutterTts.setErrorHandler((msg) => isPlaying = false);
  }

  bool get isPlaying => _isPlaying;
  set isPlaying(bool value) {
    _isPlaying = value;
    notifyListeners();
  }

  Future<void> speak(String text) async {
    await _flutterTts.speak(text);
  }

  Future<void> stop() async {
    await _flutterTts.stop();
  }

  @override
  void dispose() {
    stop();
    super.dispose();
  }
}
