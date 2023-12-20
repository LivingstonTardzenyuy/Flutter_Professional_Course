import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../enums/state.dart';

class AuthProviderDb extends ChangeNotifier{
  ViewState state = ViewState.Idle;
  String message = "";

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CollectionReference profileRef = FirebaseFirestore.instance.collection('users');
  loginUser(String email, String password) async {
    state = ViewState.Busy;
    notifyListeners();

    try{
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      message = "Login success";
      state = ViewState.Success;
      notifyListeners();
  }

  on FirebaseAuthException catch(e){
      message = e.message.toString();
      state = ViewState.Error;
      notifyListeners();
  }
  catch(e){
      message = e.toString();
      state = ViewState.Error;
      notifyListeners();
      // print(message);
    }

  }

  registerUser(String email, String password) async {
    state = ViewState.Busy;
    notifyListeners();

    try{
      await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      createUserProfile();
      state = ViewState.Success;
      notifyListeners();
    } on FirebaseAuthException catch(e){
      message = e.message.toString();
      state = ViewState.Error;
      notifyListeners();
    }
    catch(e){
      message = e.toString();
      state = ViewState.Error;
      notifyListeners();
    }
  }

  void createUserProfile() async {
    final body = {
      "refCode": firebaseAuth.currentUser!.uid,
      'email': firebaseAuth.currentUser!.email,
      'date_created': DateTime.now(),
      'referals': <String>[],
      'refEarning': 0,
    };

    await Future.delayed(Duration(seconds: 2));

    profileRef.add(body);
  }
}