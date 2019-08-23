import 'package:abigo_mobile/data/pref.dart';
import 'package:abigo_mobile/screens/auth/welcome_bloc.dart';
import 'package:abigo_mobile/screens/auth/welcome_event.dart';
import 'package:abigo_mobile/screens/auth/welcome_state.dart';
import 'package:abigo_mobile/screens/intro/intro_screen.dart';
import 'package:abigo_mobile/screens/text/text_chats/text_chat_screen/text_chat_screen.dart';
import 'package:abigo_mobile/screens/voice/voice_chat/voice_chat_screen/voice_chat_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AuthScreenState();
}

class AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 250.0),
        ),
        Image.asset(
          'assets/images/abigo_logo.png',
          width: 250.0,
        ),
        _buildSignIn(),
      ]),
    ));
  }

  _buildSignIn() {
    final _bloc = Provider.of<WelcomeBloc>(context);
    return StreamBuilder<WelcomeState>(
      initialData: _bloc.initialState,
      stream: _bloc.state,
      builder: (context, AsyncSnapshot<WelcomeState> snapshot) {
        final _state = snapshot.data;
        print(
            "Change state: isLoading: ${_state.isLoading} isKeyboard: ${_state.isKeyboard} isLoggedIn: ${_state.isLoggedIn}");
        if (_state.isVoice || _state.isKeyboard) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => _state.isVoice && _state.isLoggedIn
                    ? VoiceChatScreen()
                    : _state.isVoice && !_state.isLoggedIn
                        ? IntroScreen(
                            method: Pref.INPUT_METHOD_VOICE,
                          )
                        : _state.isKeyboard && _state.isLoggedIn
                            ? TextChatScreen()
                            : IntroScreen(
                                method: Pref.INPUT_METHOD_KEYBOARD,
                              ),
              ),
            ),
          );
        }
        if (!_state.isLoading && !_state.isVoice && !_state.isKeyboard) {
          return Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                Text(
                  '\"Hello\"',
                  style: TextStyle(fontSize: 40.0, color: Colors.black87),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 35.0),
                ),
                Text(
                  'Select an input type',
                  style: TextStyle(fontSize: 20.0, color: Colors.black87),
                ),
                Center(
                  child: ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      OutlineButton.icon(
                        padding: EdgeInsets.all(10.0),
                        icon: const Icon(
                          Icons.mic,
                          size: 20.0,
                          color: Colors.black87,
                        ),
                        label: const Text(
                          'Voice',
                          style:
                              TextStyle(fontSize: 20.0, color: Colors.black87),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(35, 153, 209, 1), width: 1.5),
                        onPressed: () => _bloc.dispatch(WelcomeEvent.voice),
                      ),
                      OutlineButton.icon(
                        padding: EdgeInsets.all(10.0),
                        icon: const Icon(
                          Icons.text_fields,
                          size: 20.0,
                          color: Colors.black87,
                        ),
                        label: const Text(
                          'Text',
                          style:
                              TextStyle(fontSize: 20.0, color: Colors.black87),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(35, 153, 209, 1), width: 1.5),
                        onPressed: () => _bloc.dispatch(WelcomeEvent.keyboard),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
