import 'package:flutter/material.dart';
import 'textLogin.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    return DecoratedBox(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: AssetImage('images/panda.jpeg'),
            fit: BoxFit.cover
          ),
        ),
        child: Center(
          child: ButtonTheme(
            height: 50.0,
            minWidth: 150.0,
            child: RaisedButton(
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
          )
        ),
    );
  }
}