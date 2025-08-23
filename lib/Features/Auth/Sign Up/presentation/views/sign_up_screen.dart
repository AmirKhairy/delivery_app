import 'package:delivery_app/Features/Auth/Sign%20Up/presentation/view-models/sign_up_cubit.dart';
import 'package:delivery_app/Features/Auth/Sign%20Up/presentation/views/widgets/sign_up_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => SignUpCubit(),
        child: SignUpScreenBody(
          formKey: formKey,
          nameController: nameController,
          emailController: emailController,
          passwordController: passwordController,
        ),
      ),
    );
  }
}
