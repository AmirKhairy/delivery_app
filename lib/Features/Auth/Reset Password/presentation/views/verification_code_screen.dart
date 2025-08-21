import 'package:delivery_app/Features/Auth/Reset%20Password/presentation/views/widgets/verification_code_screen_body.dart';
import 'package:flutter/material.dart';

class VerificationCodeScreen extends StatelessWidget {
  VerificationCodeScreen({super.key});
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: VerificationCodeScreenBody(otpController: otpController),
    );
  }
}