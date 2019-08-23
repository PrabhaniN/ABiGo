import 'package:abigo_mobile/data/pref.dart';
import 'package:abigo_mobile/data/repository.dart';
import 'package:abigo_mobile/screens/auth/welcome_event.dart';
import 'package:abigo_mobile/screens/auth/welcome_state.dart';
import 'package:bloc/bloc.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  final _repo = Repository();

  WelcomeBloc() {
    _repo.isLoggedIn().then((isLoggedIn) {
      print("isLoggedIn $isLoggedIn");
      if (isLoggedIn) dispatch(WelcomeEvent.loggedIn);
    }).then((_) {
      return _repo.getInputMethod().then((method) {
        print("getInputMethod $method");
        if (method != null && method == Pref.INPUT_METHOD_VOICE) {
          dispatch(WelcomeEvent.voiceLoaded);
        } else if (method != null && method == Pref.INPUT_METHOD_KEYBOARD) {
          dispatch(WelcomeEvent.keyboardLoaded);
        }
      });
    }).whenComplete(() {
      print("whenComplete");
      dispatch(WelcomeEvent.loaded);
    });
  }

  @override
  WelcomeState get initialState => WelcomeState.initial();

  @override
  Stream<WelcomeState> mapEventToState(WelcomeEvent event) async* {
    switch (event) {
      case WelcomeEvent.loggedIn:
        print("State: loggedIn");
        yield WelcomeState.hasLoggedIn(currentState);
        break;
      case WelcomeEvent.loaded:
        print("State: loaded");
        yield WelcomeState.loaded(currentState);
        break;
      case WelcomeEvent.voiceLoaded:
        print("State: voice loaded");
        yield WelcomeState.isVoice(currentState);
        break;
      case WelcomeEvent.keyboardLoaded:
        print("State: keyboard loaded");
        yield WelcomeState.isKeyboard(currentState);
        break;
      case WelcomeEvent.voice:
        print("State: voice");
        await _repo.setInputMethod(Pref.INPUT_METHOD_VOICE);
        yield WelcomeState.isVoice(currentState);
        break;
      case WelcomeEvent.keyboard:
        print("State: keyboard");
        await _repo.setInputMethod(Pref.INPUT_METHOD_KEYBOARD);
        yield WelcomeState.isKeyboard(currentState);
        break;
    }
  }
}
