import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProviderD extends ChangeNotifier{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<User?> register({required String email, required String password}) async {
    UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    notifyListeners();
    return userCredential.user;
  }

  Future<User?> login({required String email, required String password}) async {
    UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    notifyListeners();
    return userCredential.user;
  }


  Future<User?> getCurrentUser() async {
    final user = firebaseAuth.currentUser!;
    if (user != null){
      final userEmail = user.email;
      print("Email is $userEmail");
      return user;
    } else {
      print("NO user is log in");
      return null;
    }
  }
  }