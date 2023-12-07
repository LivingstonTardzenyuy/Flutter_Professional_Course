import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProviderD extends ChangeNotifier{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  bool _showSpinner = false;
  bool get showSpinner => _showSpinner;

  Future<User?> register({required String email, required String password}) async {
    _showSpinner = true;
    notifyListeners();
    try{
      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      _showSpinner = false;
      notifyListeners();
      return userCredential.user;

    } catch(e){
      _showSpinner = false;
      notifyListeners();
      print(e);
    }
  }


  Future<User?> login({required String email, required String password}) async {
    _showSpinner = true;
    notifyListeners();

    try {
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      _showSpinner = false;
      notifyListeners();
      return userCredential.user;
    } catch (e) {
      _showSpinner = false;
      notifyListeners();
      // Handle the exception or log it
      print("Login error: $e");
      return null;
    }
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