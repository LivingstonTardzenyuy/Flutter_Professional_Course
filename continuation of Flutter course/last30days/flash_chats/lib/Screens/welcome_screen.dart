import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../components/rounded_button.dart';
import '../routes.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: "logo",
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ["Chat App"], textStyle: TextStyle(color: Colors.black, fontSize: 46, fontWeight: FontWeight.w800), speed: Duration(milliseconds: 500),)
              ],
            ),

            SizedBox(
              height: 48.0,
            ),

            RoundedButton(color: Colors.lightBlueAccent, label: "Log in",
                onTap: () {
                  //Go to login screen.
                  Navigator.pushNamed(context, ChatRoutes.login_screen);
                },),

            RoundedButton(color: Colors.blueAccent, label: "Register",
                onTap:
                    () {
                  //Go to login screen.
                  Navigator.pushNamed(context, ChatRoutes.register_screen);
                },),
          ],
        ),
      ),
    );
  }
}


