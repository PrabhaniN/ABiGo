import 'package:abigo_mobile/data/pref.dart';
import 'package:abigo_mobile/screens/login/login_bloc.dart';
import 'package:abigo_mobile/screens/login/login_event.dart';
import 'package:abigo_mobile/screens/login/login_state.dart';
import 'package:abigo_mobile/screens/text/text_chats/text_chat_screen/text_chat_screen.dart';
import 'package:abigo_mobile/screens/voice/voice_chat/voice_chat_screen/voice_chat_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  final String method;

  LoginScreen({@required this.method});

  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _phoneNoController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<LoginBloc>(context);
    return Scaffold(
      // appBar: AppBar(),
      body: StreamBuilder<LoginState>(
        initialData: _bloc.initialState,
        stream: _bloc.state,
        builder: (context, snapshot) {
          final _state = snapshot.data;
          if (_state.isSuccessful) {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      widget.method == Pref.INPUT_METHOD_KEYBOARD
                          ? TextChatScreen()
                          : VoiceChatScreen(),
                ),
              ),
            );
          }
          return ListView(
            children: <Widget>[
              _state.isLoading ? LinearProgressIndicator() : Container(),
              Padding(
                padding: EdgeInsets.only(top: 200.0),
              ),
              ListTile(
                title: OutlineButton.icon(
                  padding: EdgeInsets.all(10.0),
                  label: const Text(
                    'Google',
                    style: TextStyle(fontSize: 20.0, color: Colors.black87),
                  ),
                  icon: Image.asset('assets/images/google.png', height: 20.0,),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  borderSide: BorderSide(color: Color.fromRGBO(35, 153, 209, 1), width: 1.5),
                  onPressed: () {
                    _bloc.dispatch(SignInWithGoogle());
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(20.0, 50.0, 5.0, 20.0),
                title: TextFormField(
                  cursorColor: Colors.blue[900],
                  controller: _nameController,
                  //TODO color
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Name',
                    contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 10.0),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(10.0, 20.0, 5.0, 10.0),
                title: TextFormField(
                  cursorColor: Colors.blue[900],
                  controller: _phoneNoController,
                  //TODO color
                  decoration: InputDecoration(
                    icon: Icon(Icons.phone),
                    labelText: 'Phone Number',
                    contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 10.0),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(15, 30, 15, 15),
                title: OutlineButton(
                  padding: EdgeInsets.all(10.0),
                  color: Color.fromRGBO(35, 153, 209, 1),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      // color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  borderSide: BorderSide(color: Color.fromRGBO(35, 153, 209, 1), width: 2.5),
                  onPressed: _submit,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _submit() {
    Provider.of<LoginBloc>(context)
        .dispatch(VerifyPhone(_nameController.text, _phoneNoController.text));
  }
}
