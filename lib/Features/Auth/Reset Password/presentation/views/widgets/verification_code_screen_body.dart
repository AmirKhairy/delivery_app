import 'package:delivery_app/Core/Styles/colors.dart';
import 'package:delivery_app/Features/Auth/Reset%20Password/presentation/view-models/forgot_password_cubit.dart';
import 'package:delivery_app/Features/Auth/Reset%20Password/presentation/view-models/forgot_password_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinput/pinput.dart';

class VerificationCodeScreenBody extends StatelessWidget {
  const VerificationCodeScreenBody({
    super.key,
    required this.otpController,
    required this.email,
  });

  final TextEditingController otpController;
  final String email;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 60),
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
                    'Verification Code',
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
                'Please enter the verification code that has been sent to your email address.',
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 30),

              // OTP
              BlocConsumer<ForgotPasswordCubit, ForgotPasswordStates>(
                listener: (context, state) {
                  if (state is VerifyOTPSuccessState) {
                    Fluttertoast.showToast(
                      msg: state.message,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    ).then((onValue) {
                      Navigator.pushNamed(
                        context,
                        '/ResetPasswordScreen',
                        arguments: {
                          'reset_token':
                              ForgotPasswordCubit.get(
                                context,
                              ).verifyOtpModel?.data?.resetToken ??
                              '',
                        },
                      );
                    });
                  }
                  if (state is VerifyOTPErrorState) {
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
                  return state is VerifyOTPLoadingState
                      ? Center(
                          child: CircularProgressIndicator(
                            color: ColorsStyle.primaryColor,
                            strokeWidth: 2,
                          ),
                        )
                      : Pinput(
                          controller: otpController,
                          length: 6,
                          showCursor: true,
                          autofocus: true,
                          keyboardType: TextInputType.number,

                          onCompleted: (value) {
                            cubit.verifyOTP(email: email, otp: value);
                          },

                          defaultPinTheme: PinTheme(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),

                              borderRadius: BorderRadius.circular(10),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          focusedPinTheme: PinTheme(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorsStyle.primaryColor,
                              ),

                              borderRadius: BorderRadius.circular(10),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                },
              ),
              SizedBox(height: 30),
              // Have not received the code?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Haven\'t received a code? ',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                  ),

                  BlocBuilder<ForgotPasswordCubit, ForgotPasswordStates>(
                    builder: (context, state) {
                      var cubit = ForgotPasswordCubit.get(context);
                      if (state is ReForgotPasswordSuccessState) {
                        Fluttertoast.showToast(
                          msg: state.message,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      }
                      if (state is ReForgotPasswordErrorState) {
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
                      return InkWell(
                        onTap: () {
                          cubit.reForgotPassword(email: email);
                        },
                        child: state is ReForgotPasswordLoadingState
                            ? CircularProgressIndicator(
                                color: ColorsStyle.primaryColor,
                                strokeWidth: 2,
                              )
                            : Text(
                                'Resend',
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontSize: 16,
                                  color: ColorsStyle.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationColor: ColorsStyle.primaryColor,
                                ),
                              ),
                      );
                    },
                  ),
                ],
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
