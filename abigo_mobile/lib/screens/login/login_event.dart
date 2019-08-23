abstract class LoginEvent {}

class VerifyPhone extends LoginEvent {
  final String name;
  final String phoneNumber;

  VerifyPhone(this.name, this.phoneNumber);
}

class SignInWithGoogle extends LoginEvent {}
