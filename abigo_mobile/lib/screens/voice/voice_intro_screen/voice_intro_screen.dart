import 'package:abigo_mobile/screens/voice/voice_login/voice_login.dart';
import 'package:flutter/material.dart';

class VoiceIntroScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VoiceIntroScreenState();
}

class VoiceIntroScreenState extends State<VoiceIntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'What you can do?',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        backgroundColor: Color.fromRGBO(35, 153, 209, 1),
      ),
      body: GridView.count(
        padding: EdgeInsets.all(10.0),
        crossAxisCount: 1,
        childAspectRatio: 5.0 / 2.0,
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 20.0),
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/images/speech-recognition-icon.png',
                    // width: 200.0,
                  ),
                  title: Text('Communication'),
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => VoiceLoginScreen()),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
