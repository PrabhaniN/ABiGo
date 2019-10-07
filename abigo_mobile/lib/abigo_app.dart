import 'package:abigo_mobile/screens/welcome/welcome_screen.dart';
import 'package:abigo_mobile/screens/intro/intro_screen.dart';
import 'package:abigo_mobile/screens/live/live_screen.dart';
import 'package:abigo_mobile/state/input_method_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AbigoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    InputMethodState inputMethodState = Provider.of<InputMethodState>(context);
    FirebaseUser user = Provider.of<FirebaseUser>(context);
    if (user == null) {
      if (inputMethodState.inputMethod == null) {
        return WelcomeScreen();
      } else {
        return IntroScreen();
      }
    } else {
      return LiveScreen();
    }
  }
}
