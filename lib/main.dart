import 'package:delivery_app/Core/Styles/colors.dart';
import 'package:delivery_app/Core/components.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Components().customTextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
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
                SizedBox(height: 20),

                Components().customTextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  title: 'Password',
                  hintText: 'Password',
                  keyboardType: TextInputType.text,
                  obscureText: isPasswordVisible,
                  isPassword: true,
                  onSuffixIconPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
                SizedBox(height: 20),
                Components().customButton(
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  width: double.infinity,
                  height: 60,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      print('Login');
                    }
                  },
                  color: ColorsStyle.primaryColor,
                ),
                SizedBox(height: 20),

                Components().platformLoginButtons(
                  child: Text('Login with facebook'),
                  onTap: () {
                    print('Login with facebook');
                  },
                  icon: Icon(
                    Icons.facebook,
                    color: ColorsStyle.typographyColor,
                  ),
                  border: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
