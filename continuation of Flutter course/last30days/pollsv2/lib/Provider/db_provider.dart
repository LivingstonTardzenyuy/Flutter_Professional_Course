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





    void votePoll(
        {required String? pollId,
          required DocumentSnapshot pollData,
          required int previousTotalVotes,
          required String seletedOptions}) async {
      _status = true;
      notifyListeners();

      try {
        List voters = pollData['poll']["voters"];

        voters.add({
          "name": user!.displayName,
          "uid": user!.uid,
          "selected_option": seletedOptions,
        });

        ///Create option and add items
        ///options
        List options = pollData["poll"]["options"];
        for (var i in options) {
          if (i["answer"] == seletedOptions) {
            i["percent"]++;
          } else {
            if (i["percent"] > 0) {
              i["percent"]--;
            }
          }
        }

        ///Update poll
        final data = {
          "author": {
            "uid": pollData["author"]["uid"],
            "profileImage": pollData["author"]["profileImage"],
            "name": pollData["author"]["name"],
          },
          "dateCreated": pollData["dateCreated"],
          "poll": {
            "total_votes": previousTotalVotes + 1,
            "voters": voters,
            "question": pollData["poll"]["question"],
            "duration": pollData["poll"]["duration"],
            "options": options,
          }
        };

        await pollCollection.doc(pollId).update(data);
        _message = "Vote Recorded";
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

    void clear() {
      _message = "";
      notifyListeners();
    }
  }