import 'package:flutter/material.dart';
import 'package:Abigo/bloc/base_bloc.dart';

class BlocProvider<T extends BaseBloc> extends StatefulWidget {
  final T bloc;
  final Widget child;

  BlocProvider({Key key, @required this.bloc, @required this.child});

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static Type _typeOf<T>() => T;

  static T of<T extends BaseBloc>(BuildContext context) {
    final type =  _typeOf<BlocProvider<T>>();
    BlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }
}

class _BlocProviderState<T> extends State<BlocProvider<BaseBloc>> {
  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    widget.bloc.onDispose();
    super.dispose();
  }
}