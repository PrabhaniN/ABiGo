import 'package:abigo_mobile/data/pref.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;
  Future<SharedPreferences> get _pref => SharedPreferences.getInstance();

  Future<bool> isLoggedIn() => _auth.currentUser().then((user) => user != null);

  // User Prefrences
  Future setInputMethod(String method) {
    return _pref.then((pref) {
      pref.setString(Pref.PREF_USER_INPUT_METHOD, method);
    });
  }

  Future<String> getInputMethod() {
    return _pref.then((pref) {
      return pref.getString(Pref.PREF_USER_INPUT_METHOD);
    });
  }

  // Singleton
  static final Repository _repository = Repository._internal();

  factory Repository() => _repository;

  Repository._internal();
}
