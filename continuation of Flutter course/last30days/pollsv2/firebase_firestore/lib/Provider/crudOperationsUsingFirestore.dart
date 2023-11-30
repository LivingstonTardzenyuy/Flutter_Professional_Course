import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Crud extends ChangeNotifier {
  late FirebaseFirestore firestore; // Declare as late to initialize in the constructor

  CrudAdd() {
    firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    users.add({
      "name": "Kongnyuy",
    });
  }
}
