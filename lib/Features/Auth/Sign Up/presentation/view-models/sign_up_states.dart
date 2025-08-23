abstract class SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {
  String message;
  SignUpSuccessState({required this.message});
}

class SignUpErrorState extends SignUpStates {
  String error;
  SignUpErrorState({required this.error});
}

class ChangePasswordVisibility extends SignUpStates {}
