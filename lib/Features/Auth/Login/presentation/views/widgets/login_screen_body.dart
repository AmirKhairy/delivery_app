import 'package:delivery_app/Core/Styles/colors.dart';
import 'package:delivery_app/Core/components.dart';
import 'package:delivery_app/Features/Auth/Login/presentation/view-models/login_cubit.dart';
import 'package:delivery_app/Features/Auth/Login/presentation/view-models/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
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
                const SizedBox(height: 60), // Login Label
                Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 35,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 25),
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
                BlocBuilder<LoginCubit, LoginStates>(
                  builder: (context, state) {
                    var cubit = LoginCubit.get(context);
                    return Components().customTextFormField(
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
                      obscureText: cubit.isObscure,
                      isPassword: true,
                      onSuffixIconPressed: () {
                        cubit.changePasswordVisibility();
                      },
                    );
                  },
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
                // Login Button
                BlocConsumer<LoginCubit, LoginStates>(
                  listener: (context, state) {
                    if (state is LoginSuccessState) {
                      Fluttertoast.showToast(
                        msg: 'Login successfully',
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                      );
                    }
                    if (state is LoginErrorState) {
                      Fluttertoast.showToast(
                        msg: state.error,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                      );
                    }
                  },
                  builder: (context, state) {
                    var cubit = LoginCubit.get(context);
                    return Components().customButton(
                      child: state is LoginLoadingState
                          ? CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            )
                          : Text(
                              'Login',
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          cubit.login(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        }
                      },
                      color: ColorsStyle.primaryColor,
                    );
                  },
                ),

                SizedBox(height: 15),
                // Don't have an account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(color: Colors.grey[900], fontSize: 15),
                    ),
                    SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/SignUpScreen');
                      },
                      child: Text(
                        'Sign up',
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
                  icon: Icon(
                    FontAwesomeIcons.facebook,
                    color: Colors.blueAccent,
                  ),
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
        ),
      ],
    );
  }
}
