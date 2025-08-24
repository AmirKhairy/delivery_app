import 'package:delivery_app/Core/Services/Api%20Service/dio_client.dart';
import 'package:delivery_app/Core/Services/Api%20Service/endpoints.dart';
import 'package:delivery_app/Features/Auth/Reset%20Password/data/forgot_password_model/forgot_password_model.dart';
import 'package:delivery_app/Features/Auth/Reset%20Password/data/reset_password_model/reset_password_model.dart';
import 'package:delivery_app/Features/Auth/Reset%20Password/data/verify_otp_model/verify_otp_model.dart';
import 'package:delivery_app/Features/Auth/Reset%20Password/presentation/view-models/forgot_password_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordStates> {
  ForgotPasswordCubit() : super(ForgotPasswordInitialState());

  static ForgotPasswordCubit get(context) => BlocProvider.of(context);

  final dio = DioClient(Dio());

  bool isPasswordObscure = true;
  changeVisiblePassword() {
    isPasswordObscure = !isPasswordObscure;
    emit(ChangeVisiblePasswordState());
  }

  bool isConfirmPasswordObscure = true;
  changeVisibleConfirmPassword() {
    isConfirmPasswordObscure = !isConfirmPasswordObscure;
    emit(ChangeVisibleConfirmPasswordState());
  }

  ForgotPasswordModel? forgotPasswordModel;
  Future<void> forgotPassword({required String email}) async {
    try {
      emit(ForgotPasswordLoadingState());

      final response = await dio.post(
        Endpoints.forgotPasswordEndpoint,
        data: {'email': email},
        isJson: true,
      );

      print("ForgotPassword response: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        forgotPasswordModel = ForgotPasswordModel.fromJson(response.data);
        print("msg: ${forgotPasswordModel!.msg}");
        emit(
          ForgotPasswordSuccessState(
            message: forgotPasswordModel!.msg ?? 'Otp Sent Successfully',
          ),
        );
      } else {
        print("Error message: ${response.data["msg"]}");
        emit(
          ForgotPasswordErrorState(
            errorMessage: response.data["msg"] ?? "Something went wrong",
          ),
        );
      }
    } on DioException catch (e) {
      print("⚠️ Dio error: ${e.response?.data["msg"]}");
      emit(ForgotPasswordErrorState(errorMessage: e.response?.data["msg"]));
    } catch (e) {
      print("⚠️ Dio error: $e");
      emit(ForgotPasswordErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> reForgotPassword({required String email}) async {
    try {
      emit(ReForgotPasswordLoadingState());

      final response = await dio.post(
        Endpoints.forgotPasswordEndpoint,
        data: {'email': email},
        isJson: true,
      );

      print("ForgotPassword response: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        forgotPasswordModel = ForgotPasswordModel.fromJson(response.data);
        print("msg: ${forgotPasswordModel!.msg}");
        emit(
          ReForgotPasswordSuccessState(
            message: forgotPasswordModel!.msg ?? 'Otp Sent Successfully',
          ),
        );
      } else {
        print("Error message: ${response.data["msg"]}");
        emit(
          ReForgotPasswordErrorState(
            errorMessage: response.data["msg"] ?? "Something went wrong",
          ),
        );
      }
    } on DioException catch (e) {
      print("⚠️ Dio error: ${e.response?.data["msg"]}");
      emit(ReForgotPasswordErrorState(errorMessage: e.response?.data["msg"]));
    } catch (e) {
      print("⚠️ Dio error: $e");
      emit(ReForgotPasswordErrorState(errorMessage: e.toString()));
    }
  }

  VerifyOtpModel? verifyOtpModel;
  Future<void> verifyOTP({required String email, required String otp}) async {
    try {
      emit(VerifyOTPLoadingState());

      final response = await dio.post(
        Endpoints.verifyOtpEndpoint,
        data: {'email': email, 'otp': otp},
        isJson: true,
      );

      print("VerifyOtp response: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        verifyOtpModel = VerifyOtpModel.fromJson(response.data);
        print("msg: ${verifyOtpModel!.msg}");
        print(verifyOtpModel?.data?.resetToken);

        emit(
          VerifyOTPSuccessState(
            message: verifyOtpModel!.msg ?? 'Otp Verified Successfully',
          ),
        );
      } else {
        print("Error message: ${response.data["msg"]}");
        emit(
          VerifyOTPErrorState(
            errorMessage: response.data["msg"] ?? "Something went wrong",
          ),
        );
      }
    } on DioException catch (e) {
      print("⚠️ Dio error: ${e.response?.data["msg"]}");
      emit(VerifyOTPErrorState(errorMessage: e.response?.data["msg"]));
    } catch (e) {
      print("⚠️ Dio error: $e");
      emit(VerifyOTPErrorState(errorMessage: e.toString()));
    }
  }

  ResetPasswordModel? resetPasswordModel;
  Future<void> resetPassword({
    required String newPassword,
    required String resetToken,
  }) async {
    try {

      emit(ResetPasswordLoadingState());
      final response = await dio.post(
        Endpoints.resetPasswordEndpoint,
        data: {
          'reset_token': resetToken,
          'new_password': newPassword,
        },
        isJson: true,
      );

      print("ResetPassword response: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        resetPasswordModel = ResetPasswordModel.fromJson(response.data);
        print("msg: ${resetPasswordModel!.msg}");
        emit(
          ResetPasswordSuccessState(
            message: resetPasswordModel!.msg ?? 'Password Reset Successfully',
          ),
        );
      } else {
        print("Error message: ${response.data["msg"]}");
        emit(
          ResetPasswordErrorState(
            errorMessage: response.data["msg"] ?? "Something went wrong",
          ),
        );
      }
    } on DioException catch (e) {
      print("⚠️ Dio error: ${e.response?.data["msg"]}");
      emit(ResetPasswordErrorState(errorMessage: e.response?.data["msg"]));
    } catch (e) {
      print("⚠️ Dio error: $e");
      emit(ResetPasswordErrorState(errorMessage: e.toString()));
    }
  }
}
