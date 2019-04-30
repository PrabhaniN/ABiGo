import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold( 
      body: Center(
        child: Column(
          children:<Widget>[
            Padding(
              padding: EdgeInsets.only(top: 300.0),
            ),

            Image(
              image: AssetImage('images/abigo_logo.png'),
              width: 250.0,
            ),
          ]
        ),
      )
    );
  }
}