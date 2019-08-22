import 'package:flutter/material.dart';

import 'package:abigo_mobile/screens/voice/voice_intro_screen/voice_intro_screen.dart';
import 'package:abigo_mobile/screens/text/text_intro_screen/text_intro_screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AuthScreenState();
}

class AuthScreenState extends State<AuthScreen> {
  bool isSignInVisible = true;

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
    if (isSignInVisible) {
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
                      style: TextStyle(
                        fontSize: 20.0, 
                        color: Colors.black87
                      ),
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    borderSide: BorderSide(color: Color.fromRGBO(35, 153, 209, 1), width: 1.5),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VoiceIntroScreen())
                      );
                    },
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
                      style: TextStyle(
                        fontSize: 20.0, 
                        color: Colors.black87
                      ),
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    borderSide: BorderSide(color: Color.fromRGBO(35, 153, 209, 1), width: 1.5),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TextIntroScreen())
                      );
                    },
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
  }
}
