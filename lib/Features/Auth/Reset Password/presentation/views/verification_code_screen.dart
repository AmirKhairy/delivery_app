import 'package:delivery_app/Features/Auth/Reset%20Password/presentation/view-models/forgot_password_cubit.dart';
import 'package:delivery_app/Features/Auth/Reset%20Password/presentation/views/widgets/verification_code_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationCodeScreen extends StatelessWidget {
  VerificationCodeScreen({super.key});
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String email = args["email"];
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => ForgotPasswordCubit(),
        child: VerificationCodeScreenBody(
          otpController: otpController,
          email: email,
        ),
      ),
    );
  }
}
