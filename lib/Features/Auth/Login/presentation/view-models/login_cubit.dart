import 'package:delivery_app/Core/Services/Api%20Service/dio_client.dart';
import 'package:delivery_app/Core/Services/Api%20Service/endpoints.dart';
import 'package:delivery_app/Features/Auth/Login/data/login_model.dart';
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
        print("LoginModel: ${loginModel?.email}");
        print("Access token: ${loginModel?.accessToken}");
        emit(LoginSuccessState());
      } else {
        emit(LoginErrorState(error: '${response.data["detail"]}'));
      }
    } on DioException catch (e) {
      print("DioException: ${e.response?.data}");
      emit(LoginErrorState(error: '${e.response?.data["detail"]}'));
    } catch (e) {
      print("Unknown error: $e");
      emit(LoginErrorState(error: '$e'));
    }
  }
}
