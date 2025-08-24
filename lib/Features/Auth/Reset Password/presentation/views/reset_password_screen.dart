import 'package:delivery_app/Features/Auth/Reset%20Password/presentation/view-models/forgot_password_cubit.dart';
import 'package:delivery_app/Features/Auth/Reset%20Password/presentation/views/widgets/reset_password_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String resetToken = args["reset_token"];
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => ForgotPasswordCubit(),
        child: ResetPasswordScreenBody(
          newPasswordController: newPasswordController,
          confirmPasswordController: confirmPasswordController,
          formKey: formKey,
          resetToken: resetToken,
        ),
      ),
    );
  }
}
