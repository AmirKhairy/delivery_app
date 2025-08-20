import 'package:delivery_app/Features/Auth/Login/presentation/views/login_screen.dart';
import 'package:delivery_app/Features/Auth/Welcome/presentation/views/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
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
        '/LoginScreen': (context) => const LoginScreen(),
      },
    );
  }
}
