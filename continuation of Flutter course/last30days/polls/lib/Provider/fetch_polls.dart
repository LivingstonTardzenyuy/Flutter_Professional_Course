import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FetchPollsProvider extends ChangeNotifier{
  List<DocumentSnapshot>? _pollsList = [];
  List<DocumentSnapshot>? _usersPollProvider = [];
  bool _isLoading = true;

  
  bool get isLoading => _isLoading;
  List<DocumentSnapshot>? get pollList => _pollsList;
  List<DocumentSnapshot>? get usersPollProvider => _usersPollProvider;
  
  User? user = FirebaseAuth.instance.currentUser;
  
  CollectionReference pollCollection = FirebaseFirestore.instance.collection("pollls-app");


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


  // fetching users poll
  void fetchUserPolls() async {
    pollCollection.get().then((value){
      if (value.docs.isEmpty){
        _isLoading = false;
        _usersPollProvider =[];
      } else{
        final data = value.docs;
        for (var i in data){                      //iterating across all the objects and getting only the objects that belong to the currently log in user.
          if (i.get("author")["uid"] == user!.uid){
            _usersPollProvider = data;
            _isLoading = false;
            notifyListeners();
          }
        }

      }
    });
  }
}