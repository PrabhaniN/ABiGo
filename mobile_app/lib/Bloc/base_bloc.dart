import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Abigo/Utils/auth.dart';

class Collections {
  static const String USER = 'user';
}

abstract class BaseBloc {

  final currentUser = getCurrentUser();
  final Firestore firestore = Firestore();

  void onDispose();

}