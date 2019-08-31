import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'package:abigo_mobile/screens/live_talk/live_talk_screen.dart';
import 'package:abigo_mobile/screens/text/text_chats/text_chats_list/text_chats_list.dart';

class LiveTextScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LiveTextScreenState();
}

enum TtsState { playing, stopped }

class LiveTextScreenState extends State<LiveTextScreen> {
  FlutterTts flutterTts;
  dynamic languages;
  dynamic voices;
  String language;
  String voice;
  int silencems;

  String _newVoiceText;

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;

  get isStopped => ttsState == TtsState.stopped;

  @override
  initState() {
    super.initState();
    initTts();
  }

  initTts() {
    flutterTts = FlutterTts();

    if (Platform.isAndroid) {
      flutterTts.ttsInitHandler(() {
        // _getLanguages();
        // _getVoices();
      });
    } else if (Platform.isIOS) {
      // _getLanguages();
      // _getVoices();
    }

    flutterTts.setStartHandler(() {
      setState(() {
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setErrorHandler((msg) {
      setState(() {
        ttsState = TtsState.stopped;
      });
    });
  }

  // Future _getLanguages() async {
    // languages = await flutterTts.getLanguages;
    // if (languages != null) setState(() => languages);
  // }

  // Future _getVoices() async {
    // voices = await flutterTts.getVoices;
    // if (voices != null) setState(() => voices);
  // }

  Future _speak() async {
    if (_newVoiceText != null) {
      if (_newVoiceText.isNotEmpty) {
        var result = await flutterTts.speak(_newVoiceText);
        if (result == 1) setState(() => ttsState = TtsState.playing);
      }
    }
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  // List<DropdownMenuItem<String>> getLanguageDropDownMenuItems() {
    // var items = List<DropdownMenuItem<String>>();
    // for (String type in languages) {
      // items.add(DropdownMenuItem(value: type, child: Text(type)));
    // }
    // return items;
  // }

  // List<DropdownMenuItem<String>> getVoiceDropDownMenuItems() {
    // var items = List<DropdownMenuItem<String>>();
    // for (String type in voices) {
      // items.add(DropdownMenuItem(value: type, child: Text(type)));
    // }
    // return items;
  // }

  // List<DropdownMenuItem<int>> getSilenceDropDownMenuItems() {
    // var items = List<DropdownMenuItem<int>>();
    // items.add(
        // DropdownMenuItem(value: null, child: Text("No Silence before TTS")));
    // items.add(DropdownMenuItem(
        // value: 1000, child: Text("1 Second Silence before TTS")));
    // items.add(DropdownMenuItem(
        // value: 5000, child: Text("5 Seconds Silence before TTS")));
    // return items;
  // }

  // void changedLanguageDropDownItem(String selectedType) {
    // setState(() {
      // language = selectedType;
      // flutterTts.setLanguage(language);
    // });
  // }

  // void changedVoiceDropDownItem(String selectedType) {
    // setState(() {
      // voice = selectedType;
      // flutterTts.setVoice(voice);
    // });
  // }

  // void changedSilenceDropDownItem(int selectedType) {
    // setState(() {
      // silencems = selectedType;
      // flutterTts.setSilence(silencems);
    // });
  // }

  void _onChange(String text) {
    setState(() {
      _newVoiceText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Say what you want!'),
        backgroundColor: Color.fromRGBO(35, 153, 209, 1),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // inputSection(),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 125.0, left: 25.0, right: 25.0),
              child: TextField(
                onChanged: (String value) {
                  _onChange(value);
                },
              )
            ),
            // btnSection(),
            Container(
              padding: EdgeInsets.only(top: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                children: [
                  _buildButtonColumn(
                  Color.fromRGBO(35, 153, 209, 1), Color.fromRGBO(35, 153, 209, 1), Icons.play_arrow, 'PLAY', _speak),
                  _buildButtonColumn(
                  Color.fromRGBO(35, 153, 209, 1), Color.fromRGBO(35, 153, 209, 1), Icons.stop, 'STOP', _stop)
                ]
              )
            ),
            // languages != null ? languageDropDownSection() : Text(""),
            // voices != null ? voiceDropDownSection() : Text(""),
            // Platform.isAndroid ? silenceDropDownSection() : Text("")
            Padding(padding: EdgeInsets.only(top: 50.0),),
            RaisedButton.icon(
              color: Color.fromRGBO(35, 153, 209, 1),
              label: Text(
                'Talk',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white
                ),
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              icon: Icon(Icons.mic, size: 30.0, color: Colors.white,),
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => LiveTalkScreen())
                );
              },
            )
          ]
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget inputSection() => Container(
    alignment: Alignment.topCenter,
    padding: EdgeInsets.only(top: 125.0, left: 25.0, right: 25.0),
    child: TextField(
      onChanged: (String value) {
        _onChange(value);
      },
    )
  );

  Widget btnSection() => Container(
    padding: EdgeInsets.only(top: 50.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
      children: [
        // _buildButtonColumn(
        // Colors.green, Colors.greenAccent, Icons.play_arrow, 'PLAY', _speak),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.play_arrow),
              color: Color.fromRGBO(35, 153, 209, 0.8),
              splashColor: Color.fromRGBO(35, 153, 209, 1),
              onPressed: () => _speak()
            ),
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Text('PLAY',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(35, 153, 209, 1)
                )
              )
            )
          ]
        ),
        // _buildButtonColumn(
        // Colors.red, Colors.redAccent, Icons.stop, 'STOP', _stop)
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.stop),
              color: Color.fromRGBO(35, 153, 209, 1),
              splashColor: Color.fromRGBO(35, 153, 209, 1),
              onPressed: () => _stop()
            ),
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Text('STOP',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(35, 153, 209, 1)
                )
              )
            )
          ]
        )
      ]
    )
  );

  // Widget languageDropDownSection() => Container(
      // padding: EdgeInsets.only(top: 50.0),
      // child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        // DropdownButton(
          // value: language,
          // items: getLanguageDropDownMenuItems(),
          // onChanged: changedLanguageDropDownItem,
        // )
      // ]));

  // Widget voiceDropDownSection() => Container(
      // padding: EdgeInsets.only(top: 30.0),
      // child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        // DropdownButton(
          // value: voice,
          // items: getVoiceDropDownMenuItems(),
          // onChanged: changedVoiceDropDownItem,
        // )
      // ]));

  // Widget silenceDropDownSection() => Container(
      // padding: EdgeInsets.only(top: 30.0),
      // child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        // DropdownButton(
          // value: silencems,
          // items: getSilenceDropDownMenuItems(),
          // onChanged: changedSilenceDropDownItem,
        // )
      // ]));

  Column _buildButtonColumn(Color color, Color splashColor, IconData icon,
      String label, Function func) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(icon),
          color: color,
          splashColor: splashColor,
          onPressed: () => func()),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(label,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: color
            )
          )
        )
      ]
    );
  }
}
