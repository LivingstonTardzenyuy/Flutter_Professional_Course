import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FetchPollsProvider extends ChangeNotifier{
  List<DocumentSnapshot> _pollsList = [];
  List<DocumentSnapshot> _usersPollProvider = [];
  DocumentSnapshot? _individualPoll;

  bool _isLoading = true;

  
  bool get isLoading => _isLoading;
  List<DocumentSnapshot> get pollList => _pollsList;
  List<DocumentSnapshot> get userPollProvider => _usersPollProvider;
  DocumentSnapshot get individualPolss => _individualPoll!;

  User? user = FirebaseAuth.instance.currentUser;
  
  CollectionReference pollCollection = FirebaseFirestore.instance.collection("polls");


  //fetching all polls
  void fetchAllPolls() async {
    pollCollection.get().then((value){
      if (value.docs.isEmpty){
        _pollsList = [];
        _isLoading = false;
        notifyListeners();
      } else {
        final data = value.docs;            // getting all objects from db.
        _pollsList = data;
        _isLoading = false;
        notifyListeners();
      }
    });
  }

  void fetchUserPolls() async {
    pollCollection
        .where("author.uid", isEqualTo: user!.uid)
        .get()
        .then((value) {
      if (value.docs.isEmpty) {
        _isLoading = false;
        _usersPollProvider = [];
      } else {
        final data = value.docs;
        _usersPollProvider = data;
        _isLoading = false;
        notifyListeners();
      }
    });
  }

  //fetching individual polls
  void fetchIndividualPolls(String id) async {
    pollCollection.doc(id).get().then((value){
      if(!value.exists){
        _individualPoll = value;
        _isLoading = false;
        notifyListeners();
      } else {
        final data = value;
        _individualPoll = data;
        _isLoading = false;
        notifyListeners();
      }
    });
  }
}