import 'package:abigo_mobile/screens/live/tts_state.dart/tts_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_recognition/speech_recognition.dart';

import 'package:abigo_mobile/screens/voice/voice_chat/voice_chat_list/voice_chat_list.dart';

class LiveTalkPage extends StatefulWidget {
  // final String method;

  // const LiveTalkPage({@required this.method});

  @override
  State<StatefulWidget> createState() => LiveTalkPageState();
}

class LiveTalkPageState extends State<LiveTalkPage> {
  TtsState _ttsState;
  bool _isInstructionRead = false;
  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;
  String resultText = "";

  @override
  void initState() {
    super.initState();
    initSpeechRecognizer();
  }

  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();

    _speechRecognition.setAvailabilityHandler(
      (bool result) => setState(() => _isAvailable = result),
    );

    _speechRecognition.setRecognitionStartedHandler(
      () => setState(() => _isListening = true),
    );

    _speechRecognition.setRecognitionResultHandler(
      (String speech) => setState(() => resultText = speech),
    );

    _speechRecognition.setRecognitionCompleteHandler(
      () => setState(() => _isListening = false),
    );

    _speechRecognition.activate().then(
          (result) => setState(() => _isAvailable = result),
        );
  }

  void _readIstructionsOnce() {
    if (_isInstructionRead) return;
    _ttsState.speak("I'm on Speak page");
    _isInstructionRead = true;
  }

  @override
  Widget build(BuildContext context) {
    _ttsState = Provider.of<TtsState>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) => _readIstructionsOnce());
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20.0),
                ),
                FloatingActionButton(
                  heroTag: 4,
                  child: Icon(Icons.cancel),
                  mini: true,
                  backgroundColor: Color.fromRGBO(35, 153, 209, 0.8),
                  onPressed: () {
                    if (_isListening)
                      _speechRecognition.cancel().then(
                            (result) => setState(() {
                              _isListening = result;
                              resultText = "";
                            }),
                          );
                  },
                ),
                FloatingActionButton(
                  heroTag: 3,
                  child: Icon(Icons.mic),
                  onPressed: () {
                    if (_isAvailable && !_isListening)
                      _speechRecognition
                          .listen(locale: "en_US")
                          .then((result) => print('$result'));
                  },
                  backgroundColor: Color.fromRGBO(35, 153, 209, 1),
                ),
                FloatingActionButton(
                  heroTag: 2,
                  child: Icon(Icons.stop),
                  mini: true,
                  backgroundColor: Color.fromRGBO(35, 153, 209, 1),
                  onPressed: () {
                    if (_isListening)
                      _speechRecognition.stop().then(
                            (result) => setState(() => _isListening = result),
                          );
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 50.0),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(6.0),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 12.0,
              ),
              child: Text(
                resultText,
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50.0),
            ),
            RaisedButton.icon(
              color: Color.fromRGBO(35, 153, 209, 1),
              label: Text(
                'Text',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              icon: Icon(
                Icons.text_fields,
                color: Colors.white,
                size: 30.0,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              onPressed: () {},
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 1,
        label: Text('Chats'),
        icon: Icon(Icons.message),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => VoiceChatList()),
          );
        },
        backgroundColor: Color.fromRGBO(35, 153, 209, 1),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  @override
  void dispose() {
    _ttsState.stop();
    super.dispose();
  }
}
