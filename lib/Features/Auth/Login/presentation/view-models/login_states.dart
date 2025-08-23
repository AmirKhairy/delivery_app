abstract class LoginStates {}

class ChangeVisiblePasswordState extends LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class LoginErrorState extends LoginStates {
  String error;
  LoginErrorState({required this.error});
}
