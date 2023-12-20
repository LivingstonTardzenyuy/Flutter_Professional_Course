import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ref_app/screen/home_page.dart';

import '../authentication/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() {
    Future.delayed(const Duration(seconds: 3), () {
      if (auth.currentUser != null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
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
