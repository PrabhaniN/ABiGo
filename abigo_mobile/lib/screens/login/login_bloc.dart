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
      yield currentState;
    }
  }
}
