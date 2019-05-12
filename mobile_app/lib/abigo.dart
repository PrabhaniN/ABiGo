import 'package:flutter/material.dart';
import 'package:Abigo/Screens/home.dart';
// import 'package:Abigo/Screens/signup.dart';

class Abigo {
  Abigo() {
    runApp(MaterialApp(
      title: 'ABiGo',
      home: HomePage(),
      // home: SignupPage(),
    ));
  }
}
