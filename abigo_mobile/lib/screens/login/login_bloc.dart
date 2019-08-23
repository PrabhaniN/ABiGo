
import 'package:abigo_mobile/screens/login/login_event.dart';
import 'package:abigo_mobile/screens/login/login_state.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _googleSignIn = GoogleSignIn();
  final _auth = FirebaseAuth.instance;

  @override
  LoginState get initialState => LoginState.initialized();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is VerifyPhone) {
      yield LoginState.loading();
      _auth.verifyPhoneNumber(
        phoneNumber: event.phoneNumber,
        timeout: Duration(seconds: 120),
        codeAutoRetrievalTimeout: (msg, [index]) {
        },
        codeSent: (code, [index]) {
        },
        verificationCompleted: (credential) async* {
          yield LoginState.success();
        },
        verificationFailed: (exception) async* {
          print(exception.message);
          yield LoginState.error(exception.message);
        },
      );
    } else if (event is SignInWithGoogle) {
      yield LoginState.loading();
      await _signInWithGoogle();
      yield LoginState.success();
    }
  }

  Future<FirebaseUser> _signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }
}
