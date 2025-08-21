import 'package:delivery_app/Core/Styles/colors.dart';
import 'package:delivery_app/Core/components.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgotPasswordScreenBody extends StatelessWidget {
  const ForgotPasswordScreenBody({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
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
              Components().customButton(
                child: const Text(
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
                  Navigator.pushNamed(context, '/VerificationCodeScreen');
                },
                color: ColorsStyle.primaryColor,
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
