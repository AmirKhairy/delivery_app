import 'package:delivery_app/Core/Styles/colors.dart';
import 'package:delivery_app/Core/components.dart';
import 'package:delivery_app/Features/Auth/Sign%20Up/presentation/view-models/sign_up_cubit.dart';
import 'package:delivery_app/Features/Auth/Sign%20Up/presentation/view-models/sign_up_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
    required this.formKey,
  });

  final TextEditingController nameController;
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
                BlocBuilder<SignUpCubit, SignUpStates>(
                  builder: (context, state) {
                    var cubit = SignUpCubit.get(context);
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
                SizedBox(height: 30),
                // Sign Up Button
                BlocConsumer<SignUpCubit, SignUpStates>(
                  listener: (context, state) {
                    if (state is SignUpErrorState) {
                      Fluttertoast.showToast(
                        msg: state.error,
                        textColor: Colors.white,

                        backgroundColor: Colors.red,
                      );
                    }
                    if (state is SignUpSuccessState) {
                      Fluttertoast.showToast(
                        msg: state.message,
                        textColor: Colors.white,
                        backgroundColor: Colors.green,
                      );
                    }
                  },
                  builder: (context, state) {
                    var cubit = SignUpCubit.get(context);
                    return Components().customButton(
                      child: state is SignUpLoadingState
                          ? CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            )
                          : Text(
                              'Sign Up',
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          cubit.signUp(
                            name: nameController.text,
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
