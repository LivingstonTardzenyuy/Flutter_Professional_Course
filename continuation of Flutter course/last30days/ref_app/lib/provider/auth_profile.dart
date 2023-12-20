import 'package:flutter/material.dart';

import '../enums/state.dart';

class AuthProvider extends ChangeNotifier{
  ViewState state = ViewState.Idle;
  String message = "";

  // FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  loginUser(String? email, String? password) async {

  }
}