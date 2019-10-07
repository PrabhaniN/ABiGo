import 'package:abigo_mobile/screens/live/speech_recognition_state/speech_recognition_state.dart';
import 'package:abigo_mobile/screens/live/tts_state.dart/tts_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LiveTalkPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LiveTalkPageState();
}

class LiveTalkPageState extends State<LiveTalkPage> {
  TtsState _ttsState;
  SpeechRecognitionState _speechRecognitionState;
  bool _isInstructionRead = false;

  void _readIstructionsOnce() {
    if (_isInstructionRead) return;
    _ttsState.speak("I'm on Speak page");
    _isInstructionRead = true;
  }

  @override
  Widget build(BuildContext context) {
    _ttsState = Provider.of<TtsState>(context);
    _speechRecognitionState = Provider.of<SpeechRecognitionState>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) => _readIstructionsOnce());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Show what you want!'),
        backgroundColor: Color.fromRGBO(35, 153, 209, 1),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Spacer(),
            Text(
              _speechRecognitionState.resultText,
              style: TextStyle(fontSize: 24.0),
            ),
            Spacer(),
            Row(
              children: <Widget>[
                FloatingActionButton(
                  heroTag: 4,
                  child: Icon(Icons.cancel),
                  backgroundColor: Color.fromRGBO(35, 153, 209, 0.8),
                  onPressed: () {
                    _speechRecognitionState.cancel();
                  },
                ),
                Spacer(),
                FloatingActionButton(
                  heroTag: 3,
                  child: Icon(_speechRecognitionState.isListening
                      ? Icons.stop
                      : Icons.mic),
                  onPressed: () {
                    if (_ttsState.isPlaying) _ttsState.stop();
                    _speechRecognitionState.isListening
                        ? _speechRecognitionState.stop()
                        : _speechRecognitionState.listen();
                  },
                  backgroundColor: Color.fromRGBO(35, 153, 209, 1),
                ),
                Spacer(),
                FloatingActionButton(
                  heroTag: "right",
                  child: Icon(Icons.message),
                  backgroundColor: Color.fromRGBO(35, 153, 209, 0.8),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _ttsState.stop();
    super.dispose();
  }
}
