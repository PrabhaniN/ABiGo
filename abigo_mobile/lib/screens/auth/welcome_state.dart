class WelcomeState {
  bool isLoading = false;
  bool isVoice = false;
  bool isKeyboard = false;
  bool isLoggedIn = false;

  WelcomeState.initial() : isLoading = true;

  WelcomeState.loaded(WelcomeState oldState) {
    isVoice = oldState.isVoice;
    isKeyboard = oldState.isKeyboard;
    isLoggedIn = oldState.isLoggedIn;
  }

  WelcomeState.hasLoggedIn(WelcomeState oldState) {
    isLoggedIn = true;
    isLoading = oldState.isLoading;
    isVoice = oldState.isVoice;
    isKeyboard = oldState.isKeyboard;
  }

  WelcomeState.isVoice(WelcomeState oldState)
      : isVoice = true,
        isLoading = oldState.isLoading;

  WelcomeState.isKeyboard(WelcomeState oldState)
      : isKeyboard = true,
        isLoading = oldState.isLoading;
}
