abstract class SignInState {}

class SigninInititalState extends SignInState {}

class SigninValidState extends SignInState {}

// class SigninInvalidState extends SignInState {}

class SigninLoadingState extends SignInState {}

class SigninErrorState extends SignInState {
  final String errorMessage;
  SigninErrorState(this.errorMessage);
}
