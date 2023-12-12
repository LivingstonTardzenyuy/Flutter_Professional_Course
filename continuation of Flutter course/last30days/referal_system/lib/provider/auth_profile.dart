import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:referal_app/enums/state.dart';

class AuthProvider extends ChangeNotifier{
  ViewState state = ViewState.Idle;
  String message = "";

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  loginUser(String? email, String? password) async {

  }
}