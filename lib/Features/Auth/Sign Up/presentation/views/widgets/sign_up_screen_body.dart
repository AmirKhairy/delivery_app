import 'package:delivery_app/Core/Styles/colors.dart';
import 'package:delivery_app/Core/components.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 60),
              // Sign Up Label
              Text(
                'Sign Up',
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 25),
              // Name
              Components().customTextFormField(
                controller: nameController,
                validator: (validator) {
                  if (validator!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                title: 'Name',
                hintText: 'Your Name',
                keyboardType: TextInputType.text,
                obscureText: false,
                isPassword: false,
                onSuffixIconPressed: () {},
              ),
              SizedBox(height: 10),
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
                hintText: 'Your email',
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                isPassword: false,
                onSuffixIconPressed: () {},
              ),

              SizedBox(height: 10),
              // Password
              Components().customTextFormField(
                controller: passwordController,
                validator: (validator) {
                  if (validator!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                title: 'Password',
                hintText: 'Password',
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                isPassword: true,
                onSuffixIconPressed: () {},
              ),
              SizedBox(height: 10),
              // Forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/ForgotPasswordScreen');
                    },
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        color: ColorsStyle.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        decorationColor: ColorsStyle.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),
              // Sign Up Button
              Components().customButton(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {},
                color: ColorsStyle.primaryColor,
              ),

              SizedBox(height: 15),
              // Already have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.grey[900], fontSize: 15),
                  ),
                  SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/LoginScreen');
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: ColorsStyle.primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: ColorsStyle.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),
              // Sign in with
              Components().signInWithDivider(),
              SizedBox(height: 20),
              // Sign in with Facebook
              Components().platformLoginButtons(
                child: Text('Continue with Facebook'),
                onTap: () {},
                icon: Icon(FontAwesomeIcons.facebook, color: Colors.blueAccent),
                border: true,
              ),
              SizedBox(height: 15),
              // Sign in with Google
              Components().platformLoginButtons(
                child: Text('Continue with Google'),
                onTap: () {},
                icon: Icon(FontAwesomeIcons.google, color: Colors.red),
                border: true,
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
