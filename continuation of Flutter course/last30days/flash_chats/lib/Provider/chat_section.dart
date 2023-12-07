import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatSection extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance; // Add this line
  CollectionReference pollCollection =
  FirebaseFirestore.instance.collection("messages");

  String? senderEmail; // Variable to store the sender's email

  Future<void> AddChat({required String sender, required String text}) async {
    try {
      final data = {
        "sender": sender,
        "text": text
      };
      await pollCollection.add(data);
      notifyListeners();
    } catch (e) {
      print(e);
      notifyListeners();
    }
  }

  Future<void> getChat() async {
    // Use snapshots() to get real-time updates
    pollCollection.snapshots().listen((QuerySnapshot messages) {
      for (var message in messages.docs) {
        print(message.data());
      }
    });
  }


  Future<String?> getCurrentUserEmail() async {
    try {
      User? user = auth.currentUser;
      if (user != null) {
        return user.email;
      } else {
        print("No user is logged in");
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}