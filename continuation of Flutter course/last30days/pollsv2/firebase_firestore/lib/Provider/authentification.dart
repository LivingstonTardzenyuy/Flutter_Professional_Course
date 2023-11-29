import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

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


class AuthLoginProviderGoogle extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // SIGNING IN A USER
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser
          ?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e);
    }
  }

  Future signOut() async {
    await GoogleSignIn().signOut();
    await firebaseAuth.signOut();
  }
}
