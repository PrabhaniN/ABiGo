import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';

class SpeechRecognitionState extends ChangeNotifier {
  final SpeechRecognition _speechRecognition = SpeechRecognition();
  bool _listening = false;
  bool _isAvailable = false;
  String _result = "";

  SpeechRecognitionState() {
    _speechRecognition.setAvailabilityHandler((bool result) {
      if (!result)
        _speechRecognition.activate().then((result) => _isAvailable = result);
      else
        _isAvailable = result;
    });

    _speechRecognition.setRecognitionStartedHandler(() => _isListening = true);
    _speechRecognition
        .setRecognitionResultHandler((String speech) => _resultText = speech);
    _speechRecognition
        .setRecognitionCompleteHandler(() => _isListening = false);
    _speechRecognition.activate().then((value) => _isAvailable = value);

    // _speechRecognition.
  }

  bool get isListening => _listening;
  set _isListening(bool value) {
    _listening = value;
    notifyListeners();
  }

  String get resultText => _result;
  set _resultText(String text) {
    _result = text;
    notifyListeners();
  }

  Future<void> cancel() async {
    if (_listening) {
      return _speechRecognition.cancel().then((result) {
        _isListening = result;
        _resultText = "";
      });
    }
  }

  Future<void> listen() async {
    if (!_listening && _isAvailable)
      return _speechRecognition
          .listen(locale: "en_US")
          .then((result) => print('result $result'));
  }

  Future<void> stop() async {
    if (_listening)
      return _speechRecognition.stop().then((result) => _isListening = result);
  }
}
