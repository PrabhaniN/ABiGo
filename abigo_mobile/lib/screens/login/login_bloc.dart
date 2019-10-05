import 'package:abigo_mobile/screens/login/login_event.dart';
import 'package:abigo_mobile/screens/login/login_state.dart';
import 'package:bloc/bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => LoginState.initialState;

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    try {
      yield LoginState.signingIn;
      yield await event.execute();
    } catch (e) {
      yield LoginState.error;
    }
  }
}

// if (event is VerifyPhone) {
//       yield LoginState.loading();
//       _auth.verifyPhoneNumber(
//         phoneNumber: event.phoneNumber,
//         timeout: Duration(seconds: 120),
//         codeAutoRetrievalTimeout: (msg, [index]) {},
//         codeSent: (code, [index]) {},
//         verificationCompleted: (credential) async* {
//           yield LoginState.success();
//         },
//         verificationFailed: (exception) async* {
//           print(exception.message);
//           yield LoginState.error(exception.message);
//         },
//       );
