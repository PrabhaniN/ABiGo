import 'package:abigo_mobile/screens/login/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class LoginEvent {
  Future<LoginState> execute();
}

class VerifyPhone extends LoginEvent {
  final String name;
  final String phoneNumber;

  VerifyPhone(this.name, this.phoneNumber);

  @override
  Future<LoginState> execute() {
    // TODO: implement execute
    return null;
  }
}

class SignInWithGoogle extends LoginEvent {
  @override
  Future<LoginState> execute() async {
    try {
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final FirebaseUser user =
          (await FirebaseAuth.instance.signInWithCredential(credential)).user;
      print("signed in " + user.displayName);
      return LoginState.success;
    } catch (e,_) {
      print(e);
      print(_);
      return LoginState.error;
    }
  }
}
