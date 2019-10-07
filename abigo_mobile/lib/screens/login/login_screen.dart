import 'package:abigo_mobile/data/pref.dart';
import 'package:abigo_mobile/screens/guide/text_guide_screen.dart';
import 'package:abigo_mobile/screens/guide/voice_guide_screen.dart';
import 'package:abigo_mobile/state/input_method_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:abigo_mobile/screens/login/bloc.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _phoneNoController = TextEditingController();
  final _nameController = TextEditingController();
  final _bloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    InputMethodState inputMethodState = Provider.of<InputMethodState>(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          BlocListener(
            bloc: _bloc,
            listener: (context, state) {
              if (state == LoginState.success) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => inputMethodState.inputMethod ==
                            Pref.INPUT_METHOD_KEYBOARD
                        ? TextGuideScreen()
                        : VoiceGuideScreen(),
                  ),
                );
              }
            },
            child: Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: BlocBuilder<LoginBloc, LoginState>(
                bloc: _bloc,
                builder: (context, state) {
                  return state == LoginState.signingIn
                      ? LinearProgressIndicator()
                      : SizedBox.shrink();
                },
              ),
            ),
          ),
          Spacer(),
          ListTile(
            title: OutlineButton.icon(
                padding: EdgeInsets.all(10.0),
                label: const Text(
                  'Google',
                  style: TextStyle(fontSize: 20.0, color: Colors.black87),
                ),
                icon: Icon(FontAwesomeIcons.google),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                borderSide: BorderSide(
                    color: Color.fromRGBO(35, 153, 209, 1), width: 1.5),
                onPressed: () => _bloc.currentState == LoginState.signingIn
                    ? null
                    : _bloc.dispatch(SignInWithGoogle())),
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              borderSide: BorderSide(
                  color: Color.fromRGBO(35, 153, 209, 1), width: 2.5),
              onPressed: _bloc.currentState == LoginState.signingIn
                  ? null
                  : _submit, //TODO navigate to guide screen
            ),
          ),
        ],
      ),
    );
  }

  void _submit() {
    _bloc.dispatch(VerifyPhone(
        name: _nameController.text, phoneNumber: _phoneNoController.text));
  }
}
