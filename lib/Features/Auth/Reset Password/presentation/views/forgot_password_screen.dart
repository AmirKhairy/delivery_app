import 'package:delivery_app/Features/Auth/Reset%20Password/presentation/views/widgets/forgot_password_screen_body.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ForgotPasswordScreenBody(emailController: emailController),
    );
  }
}
