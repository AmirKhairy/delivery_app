import 'package:delivery_app/Features/Auth/Reset%20Password/presentation/views/widgets/reset_password_screen_body.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ResetPasswordScreenBody(
        newPasswordController: newPasswordController,
        confirmPasswordController: confirmPasswordController,
      ),
    );
  }
}
