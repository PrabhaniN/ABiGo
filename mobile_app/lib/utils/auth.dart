import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:Abigo/model/user.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = new GoogleSignIn();
User _currentUser;

Future<FirebaseUser> signInWithGoogle() async {
final GoogleSignInAccount googleAccount = await _googleSignIn.signIn().catchError((Error error) {});
final GoogleSignInAuthentication googleAuth = await googleAccount.authentication.catchError((Error error) {});
final AuthCredential credential = GoogleAuthProvider.getCredential(
  accessToken: googleAuth.accessToken,
  idToken: googleAuth.idToken,
);
return _auth.signInWithCredential(credential);
}

Future<Null> signOutWithGoogle() async {
  // Sign out with firebase
  await _auth.signOut();
  // Sign out with google
  await _googleSignIn.signOut();
}

void setCurrentUser(User user){
    _currentUser = user;
}

User getCurrentUser() {
  return _currentUser;
}