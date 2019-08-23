class LoginState {
  bool isLoading = false;
  bool isSuccessful = false;
  String error;

  LoginState.loading() : isLoading = true;

  LoginState.initialized();

  LoginState.success() : isSuccessful = true;

  LoginState.error(this.error);
}
