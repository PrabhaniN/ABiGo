import 'package:flutter/material.dart';

import 'package:abigo_mobile/screens/voice/voice_chat/voice_chat_list/voice_chat_list.dart';

class VoiceLoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VoiceLoginScreenState();
}

class VoiceLoginScreenState extends State<VoiceLoginScreen> {
  final _phoneNoController = TextEditingController();
  final _nameController = TextEditingController();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 200.0),
          ),
          IconButton(
            icon: Icon(
              Icons.mic,
              size: 100.0,
            ),
            tooltip: 'Enter the Phone Number',
            onPressed: () {},
            color: Color.fromRGBO(35, 153, 209, 1),
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
            title: RaisedButton(
              color: Color.fromRGBO(35, 153, 209, 1),
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                ),
              ),
              onPressed: (){
                // _submit();
                Navigator.push(context, MaterialPageRoute(builder: (context) => VoiceChatList()));
              },
            ),
          )
        ],
      ),
    );
  }
}