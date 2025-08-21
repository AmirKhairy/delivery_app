import 'package:delivery_app/Features/Auth/Sign%20Up/presentation/views/widgets/sign_up_screen_body.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SignUpScreenBody(
        nameController: nameController,
        emailController: emailController,
        passwordController: passwordController,
      ),
    );
  }
}
