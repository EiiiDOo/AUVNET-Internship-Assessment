abstract class AuthEvent {}

class SignInRequestedEvent extends AuthEvent {
  final String email;
  final String password;

  SignInRequestedEvent(this.email, this.password);
}

class SignUpRequestedEvent extends AuthEvent {
  final String email;
  final String password;

  SignUpRequestedEvent(this.email, this.password);
}

class SignOutRequestedEvent extends AuthEvent {}

class CheckSignedInStatusEvent extends AuthEvent {}
