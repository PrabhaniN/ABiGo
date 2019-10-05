import 'package:abigo_mobile/screens/auth/welcome_bloc.dart';
import 'package:abigo_mobile/screens/auth/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Abigo {
  Abigo() {
    runApp(
      MaterialApp(
        title: 'ABiGo',
        debugShowCheckedModeBanner: false,
        home: MultiProvider(
          providers: [
            Provider<WelcomeBloc>(
              builder: (context) => WelcomeBloc(),
            ),
            StreamProvider.value(
              value: FirebaseAuth.instance.currentUser().asStream(),
            ),
          ],
          child: AuthScreen(),
        ),
      ),
    );
  }
}
