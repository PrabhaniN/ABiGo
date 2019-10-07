import 'package:abigo_mobile/screens/live/tts_state.dart/tts_state.dart';
import 'package:flutter/material.dart';
import 'package:abigo_mobile/screens/live_talk/live_talk_screen.dart';
import 'package:abigo_mobile/screens/text/text_chats/text_chats_list/text_chats_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LiveScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LiveScreenState();
}

class LiveScreenState extends State<LiveScreen> {
  TextEditingController _textEditingController = TextEditingController();
  TtsState _ttsState;
  Set<String> _previous = Set();

  @override
  void dispose() {
    _ttsState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _ttsState = Provider.of<TtsState>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Say what you want!'),
        backgroundColor: Color.fromRGBO(35, 153, 209, 1),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Stack(
          children: [
            Column(
              children: [
                TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          WidgetsBinding.instance.addPostFrameCallback(
                              (_) => _textEditingController.clear());
                        }),
                  ),
                ),
                IconButton(
                  iconSize: 50,
                  splashColor: Color.fromRGBO(35, 153, 209, 1),
                  icon: Icon(
                    _ttsState.isPlaying
                        ? FontAwesomeIcons.stop
                        : FontAwesomeIcons.play,
                    color: Color.fromRGBO(35, 153, 209, 1),
                  ),
                  onPressed: () =>
                      _handleOnPressed(_textEditingController.text),
                ),
                Text(
                  _ttsState.isPlaying ? "Stop" : "Play",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w800,
                    color: Color.fromRGBO(35, 153, 209, 1),
                  ),
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: _previous
                        .map(
                          (t) => ListTile(
                            leading: Icon(Icons.mic),
                            title: Text(t),
                            trailing: IconButton(
                              icon: Icon(Icons.replay),
                              onPressed: () {
                                _handleOnPressed(t);
                              },
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton.extended(
                heroTag: "left",
                label: Text('Talk'),
                icon: Icon(Icons.mic),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LiveTalkScreen()),
                  );
                },
                backgroundColor: Color.fromRGBO(35, 153, 209, 1),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton.extended(
                heroTag: "right",
                label: Text('Chats'),
                icon: Icon(Icons.message),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TextChatsList()),
                  );
                },
                backgroundColor: Color.fromRGBO(35, 153, 209, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isPlaying = false;

  void _handleOnPressed(String text) {
    _previous.add(text);
    !_ttsState.isPlaying ? _ttsState.speak(text) : _ttsState.stop();
  }
}
