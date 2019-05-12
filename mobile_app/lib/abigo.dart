import 'package:flutter/material.dart';
import 'package:Abigo/screens/home.dart';
// import 'package:Abigo/screens/signup.dart';

class Abigo {
  Abigo() {
    runApp(MaterialApp(
      title: 'ABiGo',
      home: HomePage(),
      // home: SignupPage(),
    ));
  }
}
