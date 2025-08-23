import 'package:delivery_app/Core/Services/Api%20Service/dio_client.dart';
import 'package:delivery_app/Core/Services/Api%20Service/endpoints.dart';
import 'package:delivery_app/Features/Auth/Login/data/login_model/login_model.dart';
import 'package:delivery_app/Features/Auth/Login/presentation/view-models/login_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  DioClient dioClient = DioClient(Dio());

  bool isObscure = true;
  void changePasswordVisibility() {
    isObscure = !isObscure;
    emit(ChangeVisiblePasswordState());
  }

  LoginModel? loginModel;
  Future<void> login({required String email, required String password}) async {
    try {
      emit(LoginLoadingState());

      final response = await dioClient.post(
        Endpoints.loginEndpoint,
        data: {'username': email, 'password': password},
        isJson: false,
      );

      print("Login response: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        loginModel = LoginModel.fromJson(response.data);
        print("Email: ${loginModel!.data?.email}");
        print("Access token: ${loginModel!.data?.accessToken}");
        emit(
          LoginSuccessState(message: loginModel!.msg ?? 'Login Successfuly'),
        );
      } else {
        String errorMessage = response.data["msg"] ?? "Something went wrong";
        emit(LoginErrorState(error: errorMessage));
      }
    } on DioException catch (err) {
      if (err.response != null) {
        final errorMsg = err.response?.data["msg"] ?? "Unknown error";
        print("⚠️ Dio error: $errorMsg");
        emit(LoginErrorState(error: errorMsg));
      } else {
        print("⚠️ Dio error with no response: ${err.message}");
        emit(LoginErrorState(error: err.message ?? "Unknown error"));
      }
    } catch (e) {
      print("Catch error: $e");
      emit(LoginErrorState(error: '$e'));
    }
  }
}
