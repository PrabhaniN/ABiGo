import 'package:abigo_mobile/data/repository.dart';
import 'package:flutter/material.dart';

class InputMethodState extends ChangeNotifier {
  final Repository _repository = Repository();
  String _method;

  InputMethodState() {
    _repository.getInputMethod().then((value) {
      _inputMethod = value;
    });
  }

  set _inputMethod(String method) {
    this._method = method;
    notifyListeners();
  }

  String get inputMethod => _method;

  Future<bool> setInputMethod(String method) {
    return _repository.setInputMethod(method).then((succuess) {
      if (succuess) _inputMethod = method;
      return succuess;
    });
  }
}
