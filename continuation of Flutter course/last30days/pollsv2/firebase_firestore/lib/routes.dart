import 'package:firebase_firestore/screens/login_screens.dart';
import 'package:firebase_firestore/screens/register_screen.dart';
import 'package:flutter/material.dart';

class RoutePages{
  static final allScreens = {
    landigPage: (BuildContext context) => RegisterScreen(),
    loginPage: (BuildContext context) => LoginScreen(),
  };

  static const String landigPage = "Landing Page";
  static const String loginPage = "Login Page";
}