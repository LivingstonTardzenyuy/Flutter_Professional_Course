import 'package:firebase_firestore/screens/home_screen.dart';
import 'package:firebase_firestore/screens/login_screens.dart';
import 'package:firebase_firestore/screens/register_screen.dart';
import 'package:flutter/material.dart';

class RoutePages{
  static final allScreens = {
    landigPage: (BuildContext context) => RegisterScreen(),
    loginPage: (BuildContext context) => LoginScreen(),
    homePage: (BuildContext context) => HomeScreen(),
  };

  static const String landigPage = "Landing Page";
  static const String loginPage = "Login Page";
  static const String homePage = "Home Page";
}