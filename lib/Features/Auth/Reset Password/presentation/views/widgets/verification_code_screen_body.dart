import 'package:delivery_app/Core/Styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinput/pinput.dart';

class VerificationCodeScreenBody extends StatelessWidget {
  const VerificationCodeScreenBody({super.key, required this.otpController});

  final TextEditingController otpController;

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
              Pinput(
                controller: otpController,
                length: 6,
                showCursor: true,
                autofocus: true,
                keyboardType: TextInputType.number,
                onCompleted: (value) {
                  Navigator.pushNamed(context, '/ResetPasswordScreen');
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
                    border: Border.all(color: ColorsStyle.primaryColor),

                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
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

                  InkWell(
                    onTap: () {},
                    child: Text(
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
