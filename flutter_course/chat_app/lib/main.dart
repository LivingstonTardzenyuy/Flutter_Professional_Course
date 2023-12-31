import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/screens/registration_screen.dart';
import 'package:chat_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';


void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          // body1: TextStyle(color: Colors.black54),
        ),
      ),

      initialRoute: '/',
      routes: {
        '/':(context) => WelcomeScreen(),
        'login_screen/': (context) => LoginScreen(),
        'registration_screen/': (context) => RegistrationScreen(),
        'welcome_screen': (context) => WelcomeScreen()

    }
    );
  }
}
