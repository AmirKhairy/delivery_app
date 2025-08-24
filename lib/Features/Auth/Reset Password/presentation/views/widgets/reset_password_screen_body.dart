import 'package:delivery_app/Core/Styles/colors.dart';
import 'package:delivery_app/Core/components.dart';
import 'package:delivery_app/Features/Auth/Reset%20Password/presentation/view-models/forgot_password_cubit.dart';
import 'package:delivery_app/Features/Auth/Reset%20Password/presentation/view-models/forgot_password_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResetPasswordScreenBody extends StatelessWidget {
  const ResetPasswordScreenBody({
    super.key,
    required this.newPasswordController,
    required this.confirmPasswordController,
    required this.formKey,
    required this.resetToken,
  });

  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> formKey;
  final String resetToken;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        Form(
          key: formKey,
          child: SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 40),
                // Reset Password Text
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        FontAwesomeIcons.arrowLeft,
                        color: ColorsStyle.primaryColor,
                      ),
                    ),
                    const Text(
                      'Reset Password',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Reset Password Text Description
                Text(
                  'Please enter your new password',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 16,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 30),
                // Password
                BlocBuilder<ForgotPasswordCubit, ForgotPasswordStates>(
                  builder: (context, state) {
                    var cubit = ForgotPasswordCubit.get(context);
                    return Components().customTextFormField(
                      controller: newPasswordController,
                      validator: (validator) {
                        if (validator!.isEmpty) {
                          return 'Please enter your new Password';
                        }
                        return null;
                      },
                      title: 'New Password',
                      hintText: 'New Password',
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: cubit.isPasswordObscure,
                      isPassword: true,
                      onSuffixIconPressed: () {
                        cubit.changeVisiblePassword();
                      },
                    );
                  },
                ),
                const SizedBox(height: 20),
                // Confirm Password
                BlocBuilder<ForgotPasswordCubit, ForgotPasswordStates>(
                  builder: (context, state) {
                    var cubit = ForgotPasswordCubit.get(context);

                    return Components().customTextFormField(
                      controller: confirmPasswordController,
                      validator: (validator) {
                        if (validator!.isEmpty) {
                          return 'Please enter Confirm Password';
                        }
                        if (validator != newPasswordController.text) {
                          return 'Password does not match';
                        }
                        return null;
                      },
                      title: 'Confirm Password',
                      hintText: 'Confirm Password',
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: cubit.isConfirmPasswordObscure,
                      isPassword: true,
                      onSuffixIconPressed: () {
                        cubit.changeVisibleConfirmPassword();
                      },
                    );
                  },
                ),
                const SizedBox(height: 40),
                // Send OTP Button
                BlocConsumer<ForgotPasswordCubit, ForgotPasswordStates>(
                  listener: (context, state) {
                    if (state is ResetPasswordSuccessState) {
                      Fluttertoast.showToast(
                        msg: state.message,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      ).then((onValue) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/LoginScreen',
                          (route) => false,
                        );
                      });
                    }
                    if (state is ResetPasswordErrorState) {
                      Fluttertoast.showToast(
                        msg: state.errorMessage,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    }
                  },
                  builder: (context, state) {
                    var cubit = ForgotPasswordCubit.get(context);
                    return Components().customButton(
                      child: state is ResetPasswordLoadingState
                          ? CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            )
                          : Text(
                              'Save New Password',
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                      width: double.infinity,
                      height: 50,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          print(cubit.verifyOtpModel?.data?.resetToken);
                          cubit.resetPassword(
                            newPassword: newPasswordController.text,
                            resetToken: resetToken,
                          );
                        }
                      },
                      color: ColorsStyle.primaryColor,
                    );
                  },
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
