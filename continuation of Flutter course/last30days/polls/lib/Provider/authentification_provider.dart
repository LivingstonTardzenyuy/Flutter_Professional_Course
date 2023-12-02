import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:polls/firebase_options.dart';

class AuthLoginWithEmailPassword extends ChangeNotifier{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<User?> register(String email, String password) async {
    UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    notifyListeners();
    return userCredential.user;
  }

  Future<User?> login(String email, String password) async {
    UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    notifyListeners();
    return userCredential.user;
  }
}

class AuthProviders extends ChangeNotifier{


  // SIGNING IN A USER
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // SIGNIN OUT  A USER
  Future<bool> logOut() async {
    try{
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      return true;
    }

    catch (e){
      print(e);
      return false;
    }
  }

}