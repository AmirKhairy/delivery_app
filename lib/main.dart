import 'package:delivery_app/Core/Services/Shared%20Prefs/shared_preferences_manager.dart';
import 'package:delivery_app/Features/Auth/Login/presentation/views/login_screen.dart';
import 'package:delivery_app/Features/Auth/Reset%20Password/presentation/views/forgot_password_screen.dart';
import 'package:delivery_app/Features/Auth/Reset%20Password/presentation/views/reset_password_screen.dart';
import 'package:delivery_app/Features/Auth/Reset%20Password/presentation/views/verification_code_screen.dart';
import 'package:delivery_app/Features/Auth/Sign%20Up/presentation/views/sign_up_screen.dart';
import 'package:delivery_app/Features/Auth/Welcome/presentation/views/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  PrefsManager.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
      initialRoute: '/WelcomeScreen',
      routes: {
        '/WelcomeScreen': (context) => const WelcomeScreen(),
        '/LoginScreen': (context) => LoginScreen(),
        '/SignUpScreen': (context) => SignUpScreen(),
        '/ForgotPasswordScreen': (context) => ForgotPasswordScreen(),
        '/VerificationCodeScreen': (context) => VerificationCodeScreen(),
        '/ResetPasswordScreen': (context) => ResetPasswordScreen(),
      },
    );
  }
}
