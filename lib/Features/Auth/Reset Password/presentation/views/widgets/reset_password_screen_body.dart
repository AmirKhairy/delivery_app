import 'package:delivery_app/Core/Styles/colors.dart';
import 'package:delivery_app/Core/components.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResetPasswordScreenBody extends StatelessWidget {
  const ResetPasswordScreenBody({
    super.key,
    required this.newPasswordController,
    required this.confirmPasswordController,
  });

  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
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
              Components().customTextFormField(
                controller: newPasswordController,
                validator: (validator) {
                  if (validator!.isEmpty) {
                    return 'Please enter your Password';
                  }
                  return null;
                },
                title: 'Password',
                hintText: 'Your Password',
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                isPassword: true,
                onSuffixIconPressed: () {},
              ),
              const SizedBox(height: 20),
              // Confirm Password
              Components().customTextFormField(
                controller: confirmPasswordController,
                validator: (validator) {
                  if (validator!.isEmpty) {
                    return 'Please enter Confirm Password';
                  }
                  return null;
                },
                title: 'Confirm Password',
                hintText: 'Confirm Password',
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                isPassword: true,
                onSuffixIconPressed: () {},
              ),
              const SizedBox(height: 40),
              // Send OTP Button
              Components().customButton(
                child: const Text(
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
                onTap: () {},
                color: ColorsStyle.primaryColor,
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
