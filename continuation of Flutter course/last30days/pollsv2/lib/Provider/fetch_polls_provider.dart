import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FetchPollsProvider extends ChangeNotifier {
  List<DocumentSnapshot> _pollsList = [];
  List<DocumentSnapshot> _usersList = [];

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  List<DocumentSnapshot> get pollsList => _pollsList;
  List<DocumentSnapshot> get usersList => _usersList;

  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference pollCollection = FirebaseFirestore.instance.collection('polls-v2');



  // fetch user polls
  void fetchUserPolls() async {
    pollCollection.get().then((value) {
      if (value.docs.isEmpty) {
        _usersList = [];
        _isLoading = false;
        notifyListeners();
      } else {
        final data = value.docs;
        _usersList = data.where((i) => i.get("author")["uid"] == user!.uid).toList();
      }
    });
  }

  // fetching all polls
  void fetchAllPolls() async {
    pollCollection.get().then((value) {
      if (value.docs.isEmpty) {
        _pollsList = [];
        _isLoading = false;
        notifyListeners();
      } else {
        final data = value.docs;
        _pollsList = data;
        _isLoading = false;
        notifyListeners();
      }

    });
  }

  void fetchAllDBPolls() async {
    pollCollection.get().then((value) {
      if (value.docs.isEmpty) {
        _pollsList = [];
        _isLoading = false;
        notifyListeners();
      } else {
        final data = value.docs;
        _pollsList = data;
        _isLoading = false;
        notifyListeners();
      }

    });
  }
}
