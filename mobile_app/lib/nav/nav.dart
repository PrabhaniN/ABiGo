import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:Abigo/nav/routes.dart';

class Nav extends InheritedWidget {
  final Router _router;

  Nav({@required Widget child}): this._router = Router(), super(child:child) {
    Routes.defineRoutes(_router);
  }

  static Type _typeOf<T>() => T;

  static T of<T extends Router>(BuildContext context) {
    final type = _typeOf<Nav>();
    Nav nav = context.ancestorWidgetOfExactType(type);
    return nav._router;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }

}