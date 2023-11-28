import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthLoginProvider extends ChangeNotifier{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // function to register users.
  Future<User?> register(String email, String password) async {
    UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    notifyListeners();
    return userCredential.user;
  }

  Future<User?>  login(String email, String password) async {
    UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    notifyListeners();
    return userCredential.user;
  }
}