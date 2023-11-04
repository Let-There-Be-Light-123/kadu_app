class SignInEvent {}

class SigninEmailChangedEvent extends SignInEvent {
  final emailValue;
  SigninEmailChangedEvent(this.emailValue);
}

class SigninPasswordChangedEvent extends SignInEvent {
  final passwordValue;
  SigninPasswordChangedEvent(this.passwordValue);
}

class SigninSubmittedEvent extends SignInEvent {
  final email;
  final password;
  SigninSubmittedEvent(this.email, this.password);
}
