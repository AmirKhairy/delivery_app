import 'package:delivery_app/Core/Services/Api%20Service/dio_client.dart';
import 'package:delivery_app/Core/Services/Api%20Service/endpoints.dart';
import 'package:delivery_app/Features/Auth/Sign%20Up/data/sign_up_model/sign_up_model.dart';
import 'package:delivery_app/Features/Auth/Sign%20Up/presentation/view-models/sign_up_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  DioClient dioClient = DioClient(Dio());

  bool isObscure = true;
  void changePasswordVisibility() {
    isObscure = !isObscure;
    emit(ChangePasswordVisibility());
  }

  SignUpModel? signUpModel;
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      emit(SignUpLoadingState());

      final response = await dioClient.post(
        Endpoints.registerEndpoint,
        data: {'name': name, 'email': email, 'password': password},
        isJson: true,
      );

      print("SignUp response: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        signUpModel = SignUpModel.fromJson(response.data);
        print("Email: ${signUpModel?.data?.email}");

        emit(
          SignUpSuccessState(
            message:
                signUpModel!.msg ?? 'Sign Up Successfuly, Verify Your Email',
          ),
        );
      } else {
        emit(SignUpErrorState(error: '${response.data["data"][0]["message"]}'));
      }
    } on DioException catch (e) {
      print("DioException: ${e.response?.data}");
      emit(
        SignUpErrorState(error: '${e.response?.data["data"][0]["message"]}'),
      );
    } catch (e) {
      print("Unknown error: $e");
      emit(SignUpErrorState(error: e.toString()));
    }
  }
}
