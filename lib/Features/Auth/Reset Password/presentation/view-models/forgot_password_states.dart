abstract class ForgotPasswordStates {}

class ForgotPasswordInitialState extends ForgotPasswordStates {}

class ChangeVisiblePasswordState extends ForgotPasswordStates {}

class ChangeVisibleConfirmPasswordState extends ForgotPasswordStates {}

class ForgotPasswordLoadingState extends ForgotPasswordStates {}

class ForgotPasswordSuccessState extends ForgotPasswordStates {
  final String message;
  ForgotPasswordSuccessState({required this.message});
}

class ForgotPasswordErrorState extends ForgotPasswordStates {
  final String errorMessage;
  ForgotPasswordErrorState({required this.errorMessage});
}

class ReForgotPasswordLoadingState extends ForgotPasswordStates {}

class ReForgotPasswordSuccessState extends ForgotPasswordStates {
  final String message;
  ReForgotPasswordSuccessState({required this.message});
}

class ReForgotPasswordErrorState extends ForgotPasswordStates {
  final String errorMessage;
  ReForgotPasswordErrorState({required this.errorMessage});
}

class VerifyOTPLoadingState extends ForgotPasswordStates {}

class VerifyOTPSuccessState extends ForgotPasswordStates {
  final String message;
  VerifyOTPSuccessState({required this.message});
}

class VerifyOTPErrorState extends ForgotPasswordStates {
  final String errorMessage;
  VerifyOTPErrorState({required this.errorMessage});
}

class ResetPasswordLoadingState extends ForgotPasswordStates {}

class ResetPasswordSuccessState extends ForgotPasswordStates {
  final String message;
  ResetPasswordSuccessState({required this.message});
}

class ResetPasswordErrorState extends ForgotPasswordStates {
  final String errorMessage;
  ResetPasswordErrorState({required this.errorMessage});
}
