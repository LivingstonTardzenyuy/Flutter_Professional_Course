import 'package:flutter/material.dart';
import 'package:referal_app/authentication/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isUser = false;

  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() {
    Future.delayed(const Duration(seconds: 3), () {
      if (isUser) {
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
   }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo(size: 200), // Adjust the size of FlutterLogo
      ),
    );
  }
}
