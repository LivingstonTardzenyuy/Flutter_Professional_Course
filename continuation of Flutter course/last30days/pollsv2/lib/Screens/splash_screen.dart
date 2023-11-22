import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pollsv2/Utils/router.dart';

import 'Authentification/auth_page.art.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  User? user = FirebaseAuth.instance.currentUser;

  // this method check if a user is authentificated if not then it direct the user to authenticate first.
  void navigate() {
    Future.delayed(Duration(seconds: 3), () {
      if (user == null){
        nextPageOnly(context, AuthPage());
      } else {
        // nextPage(context, MainActivityPage)
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigate();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FlutterLogo(),
      )
    );
  }
}
