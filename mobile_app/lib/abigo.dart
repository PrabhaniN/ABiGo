import 'package:flutter/material.dart';
import 'package:Abigo/screens/home.dart';
// import 'package:Abigo/screens/signup.dart';
// import 'package:Abigo/screens/chat/chatScreen.dart';

class Abigo {
  Abigo() {
    runApp(MaterialApp(
      title: 'ABiGo',
      home: HomePage(),
      // home: ChatScreen(),
      // home: SignupPage(),
    ));
  }
}
