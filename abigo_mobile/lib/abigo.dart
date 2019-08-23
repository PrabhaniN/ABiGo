import 'package:flutter/material.dart';
import 'package:abigo_mobile/screens/auth_screen.dart';

class Abigo {
  Abigo() {
    runApp(
      MaterialApp(
        title: 'ABiGo',
        debugShowCheckedModeBanner: false,
        home: AuthScreen(),
      ),
    );
  }
}
