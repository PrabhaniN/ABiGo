import 'package:abigo_mobile/abigo_app.dart';
import 'package:abigo_mobile/screens/live/tts_state.dart/tts_state.dart';
import 'package:flutter/material.dart';
import 'package:abigo_mobile/state/input_method_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MaterialApp(
        title: 'ABiGo',
        debugShowCheckedModeBanner: false,
        home: MultiProvider(
          providers: [
            StreamProvider<FirebaseUser>.value(
              value: FirebaseAuth.instance.currentUser().asStream(),
            ),
            ChangeNotifierProvider<InputMethodState>.value(
              value: InputMethodState(),
            ),
            ChangeNotifierProvider<TtsState>.value(
              value: TtsState(),
            ),
          ],
          child: AbigoApp(),
        ),
      ),
    );
