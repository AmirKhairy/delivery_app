import 'package:delivery_app/Core/Styles/colors.dart';
import 'package:delivery_app/Core/components.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WelcomeScreenBody extends StatelessWidget {
  const WelcomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacer(),
        Text(
          'Welcome to',
          style: TextStyle(
            fontFamily: 'Rubik',
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: Colors.black,
          ),
        ),
        Text(
          'Fast Food',
          style: TextStyle(
            fontFamily: 'Rubik',
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: ColorsStyle.primaryColor,
          ),
        ),

        SizedBox(height: 5),
        Text(
          'Get your favourite meals delivered quickly right to your doorstep',
          style: TextStyle(fontSize: 20, color: Colors.grey[750]),
        ),
        SizedBox(height: 50),

        Components().customButton(
          child: Text(
            'Start with email',
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/LoginScreen');
          },
          color: Colors.black,
        ),
        SizedBox(height: 40),

        Components().signInWithDivider(),
        SizedBox(height: 30),

        Components().platformLoginButtons(
          child: Text(
            'Continue with Facebook',
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          onTap: () {},
          icon: Icon(FontAwesomeIcons.facebook, color: Colors.blueAccent),
          border: false,
        ),
        SizedBox(height: 15),

        Components().platformLoginButtons(
          child: Text(
            'Continue with Google',
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          onTap: () {},
          icon: Icon(FontAwesomeIcons.google, color: Colors.red),
          border: false,
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
