import 'package:flutter/material.dart';
import 'chat_page.dart';

class TextLoginPage extends StatefulWidget {
  @override
  _TextLoginPageState createState() => _TextLoginPageState();
}

class _TextLoginPageState extends State<TextLoginPage> {
  final _usernameController =TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 250.0,
            ),
            TextFormField(
              controller: _usernameController,
              validator: (value) {
                if(value.isEmpty) {
                  return 'Enter a valid username';
                }
              },
              decoration: InputDecoration(
                hintText: 'Enter your username',
                filled: true,
                contentPadding: EdgeInsets.all(20.0)
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            ButtonTheme(
              height: 50.0,
              minWidth: 150.0,
              buttonColor: Colors.blue[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)
              ),
              child: RaisedButton(
                textColor: Colors.white,
                child: Text('Continue'),
                onPressed: (){
                  if(_formKey.currentState.validate()){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));
                  }
                },
              ),
            ),
          ],
        ),
      ), 
    );
  }
}