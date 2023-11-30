import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Crud extends ChangeNotifier {
  late FirebaseFirestore firestore; // Declare as late to initialize in the constructor

  Crud() {
    // Initialize firestore in the constructor
    firestore = FirebaseFirestore.instance;
  }

  void AddData() {
    CollectionReference users = firestore.collection('users');
    users.doc("Flutter123").set({
      "name": "Google flutter",
    });
  }

  Future<void> GetData() async {
    CollectionReference users = firestore.collection('users');
    QuerySnapshot allResults = await users.get();
    allResults.docs.forEach((DocumentSnapshot result) {
      print(result.data());
    });

    DocumentSnapshot result = await users.doc
  }

}
