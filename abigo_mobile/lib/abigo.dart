import 'package:abigo_mobile/screens/auth/welcome_bloc.dart';
import 'package:abigo_mobile/screens/auth/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Abigo {
  Abigo() {
    runApp(
      MaterialApp(
        title: 'ABiGo',
        debugShowCheckedModeBanner: false,
        home: Provider<WelcomeBloc>(
          builder: (context) => WelcomeBloc(),
          child: AuthScreen(),
        ),
      ),
    );
  }
}
