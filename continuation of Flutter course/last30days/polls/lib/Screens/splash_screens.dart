import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:polls/Utils/router.dart';

import 'authentification/auth_page.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  User? user = FirebaseAuth.instance.currentUser;

  void navigate(){
    Future.delayed(const Duration(seconds: 3), () {
      if(user == null) {
        nextPageOnly(context, AuthPage());
      }
        else{
          // nextPageOnly(context, Main)
      }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              child: FlutterLogo(),
            ),
          ),
        )
    );
  }
}
