import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadu_ngo/business_logic/signin_bloc/signin_event.dart';
import 'package:kadu_ngo/business_logic/signin_bloc/signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SigninInititalState()) {
    on<SigninEmailChangedEvent>((event, emit) {
      if (event.emailValue == "" && EmailValidator.validate(event.emailValue)) {
        emit(SigninErrorState("Please Enter a Valid Email"));
      } else {
        emit(SigninValidState());
      }
    });
    on<SigninPasswordChangedEvent>((event, emit) {
      if (event.passwordValue.length < 8) {
        emit(SigninErrorState("Please Enter a Valid Password"));
      } else {
        emit(SigninValidState());
      }
    });
    on<SigninSubmittedEvent>((event, emit) {
      emit(SigninLoadingState());
    });
  }
}
