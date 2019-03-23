import 'package:flutter/material.dart';
import 'textLogin.dart';
import 'signup.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      // decoration: new BoxDecoration(
        // image: new DecorationImage(
          // image: AssetImage('images/panda.jpeg'),
          // fit: BoxFit.cover
        // ),
      // ),
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => SignupPage())
              );
            },
          ),
        ],
      ),  
      body: Center(
          child: ButtonTheme(
            height: 50.0,
            minWidth: 150.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.blue[900],
                textColor: Colors.white,
                padding: EdgeInsets.all(5.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Roboto',
                  ),
                ),
                onPressed: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => TextLoginPage())
                  );
                },
              ),
              IconButton(
                padding: EdgeInsets.only(top: 50.0),
                icon: Icon(Icons.help),
                iconSize: 100.0,
                color: Colors.blue[900],
                onPressed: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => TextLoginPage())
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}