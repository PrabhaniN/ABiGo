import 'package:flutter/material.dart';
import 'chat_page.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      // appBar: AppBar(
        // title: Text('bla bla'),
      // ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Image(
                  image: AssetImage('images/panda.jpeg'),
                ),
                SizedBox(height: 10.0,),
                Text('Bla bla')
              ],
            ),
            ButtonTheme(
              minWidth: 120.0,
              height: 40.0,
              shape: RoundedRectangleBorder(
                // borderRadius: BorderRadius.zero,
              ),
              child: RaisedButton(
                child: Text('Login'),
                onPressed: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => ChatPage())
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}