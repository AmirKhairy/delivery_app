import 'package:delivery_app/Core/Styles/colors.dart';
import 'package:delivery_app/Core/components.dart';
import 'package:delivery_app/Features/Auth/Reset%20Password/presentation/view-models/forgot_password_cubit.dart';
import 'package:delivery_app/Features/Auth/Reset%20Password/presentation/view-models/forgot_password_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgotPasswordScreenBody extends StatelessWidget {
  const ForgotPasswordScreenBody({
    super.key,
    required this.emailController,
    required this.formKey,
  });

  final TextEditingController emailController;

  final GlobalKey<FormState> formKey;
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
                // forgot Password Text
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
                      'Forgot Password',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // forgot Password Text Description
                Text(
                  'Please enter your email address to request a password reset.',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 16,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 30),
                // Email
                Components().customTextFormField(
                  controller: emailController,
                  validator: (validator) {
                    if (validator!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  title: 'Email',
                  hintText: 'Your Email',
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  isPassword: false,
                  onSuffixIconPressed: () {},
                ),
                const SizedBox(height: 60),
                // Send OTP Button
                BlocConsumer<ForgotPasswordCubit, ForgotPasswordStates>(
                  listener: (context, state) {
                    if (state is ForgotPasswordSuccessState) {
                      Fluttertoast.showToast(
                        msg: state.message,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      ).then((onValue) {
                        Navigator.pushNamed(
                          context,
                          '/VerificationCodeScreen',
                          arguments: {"email": emailController.text},
                        );
                      });
                    }
                    if (state is ForgotPasswordErrorState) {
                      Fluttertoast.showToast(
                        msg: state.errorMessage,
                        toastLength: Toast.LENGTH_LONG,
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
                      child: state is ForgotPasswordLoadingState
                          ? CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            )
                          : Text(
                              'Send OTP',
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
                          cubit.forgotPassword(email: emailController.text);
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
