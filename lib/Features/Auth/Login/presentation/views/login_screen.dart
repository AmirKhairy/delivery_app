import 'package:delivery_app/Features/Auth/Login/presentation/view-models/login_cubit.dart';
import 'package:delivery_app/Features/Auth/Login/presentation/views/widgets/login_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: LoginScreenBody(
          emailController: emailController,
          passwordController: passwordController,
          formKey: formKey,
        ),
      ),
    );
  }
}
