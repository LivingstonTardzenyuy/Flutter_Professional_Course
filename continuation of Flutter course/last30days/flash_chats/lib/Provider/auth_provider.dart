import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProviderD extends ChangeNotifier{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<User?> register({required String email, required String password}) async {
    UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    notifyListeners();
    return userCredential.user;
  }
  }