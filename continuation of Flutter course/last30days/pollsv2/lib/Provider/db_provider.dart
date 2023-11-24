  import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:firebase_auth/firebase_auth.dart';
  import 'package:flutter/material.dart';

  class ProviderPro extends ChangeNotifier{
    String _message = "";
    bool _status = false;

    String get message => _message;
    bool get status => _status;

    User? user = FirebaseAuth.instance.currentUser;

    CollectionReference pollCollection = FirebaseFirestore.instance.collection('polls-v2');

    void addPoll({required String question, required String duration, required List<Map> options}) async {

      try{                                        // if the result is successful then we create a JSON and send the data to our db
        final data ={
          "author": {                           // normal data extract from the persons email
            "uid": user!.uid,
            "profileImage" : user!.photoURL,
            "name" : user!.displayName,
          },

          "dateCreated" : DateTime.now(),
          "poll": {                           // getting now normal data the user entered.
            "total_votes" : 0,
            "voteers" : <Map>[],
            "questions" : question,
            "duration" : duration,
            "options" : options,
          }
        };

        await pollCollection.add(data);        //establishing connectin with our db and adding the JSON data.
        _message = "Poll Created";
        _status = false;
        notifyListeners();

      } on FirebaseException catch(e){            // display the error message coming from firebase
        _message = e.message!;
        _status = false;
        notifyListeners();
      }

      catch (e) {                                 // this refers to users code where the error may result due to network issues.
        _message = "Please try again";
        _status = false;
        notifyListeners();
      }
    }



    void deletePoll({required String pollId}) async {
      _status = true;
      notifyListeners();
      try{
        await pollCollection.doc(pollId).delete();
        _message = "Poll Deleted";
        _status = false;
        notifyListeners();
      } on FirebaseException catch (e) {
        _message = e.message!;
        _status = false;
        notifyListeners();
      } catch (e) {
        _message = "Please try again...";
        _status = false;
        notifyListeners();
      }
    }

    void clear(){
      _message = "";
      notifyListeners();
    }
  }