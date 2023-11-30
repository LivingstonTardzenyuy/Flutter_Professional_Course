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
    // QuerySnapshot allResults = await users.get();
    // allResults.docs.forEach((DocumentSnapshot result) {
    //   print(result.data());
    // });

    // DocumentSnapshot result = await users.doc
    users.doc("Flutter123").snapshots().listen((event) {
      print(event.data());
    });

  }

  Future<void> UpdateData() async {
    await firestore.collection("users").doc("Flutter123").update({
      "name" : "Flutter-Django-firebase"
      }
    );
  }

  Future<void> deleteData() async {
    await firestore.collection("users").doc("Flutter123").delete();
  }
}


class FireStoreService extends ChangeNotifier{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // CollectionReference collectionReference = firestore.settings.

  Future insertNote(String title, String description, String userId) async{
    try{
      await firestore.collection("notes").add({
       "title": title,
       "description": description,
       "data": DateTime.now(),
       "userID": userId
      });
    } catch (e){
      print(e);
    }
  }
}
