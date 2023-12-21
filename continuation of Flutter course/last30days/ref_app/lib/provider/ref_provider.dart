import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:ref_app/enums/state.dart';

class RefProvider extends ChangeNotifier{
  ViewState state = ViewState.Idle;
  String message = "";

  CollectionReference profileR = FirebaseFirestore.instance.collection('users');
  FirebaseAuth auth = FirebaseAuth.instance;

  // List<>

  setReferrals(String refCode) async {
    state = ViewState.Busy;
    notifyListeners();

    try{
      final value = await profileR.where("refCode", isEqualTo: refCode).get();
      if(value.docs.isEmpty){
        message = "RefCode is not present";
        state = ViewState.Error;
        notifyListeners();
      } else {
        // hence it exist
        final data = value.docs[0];
        List referalls = data.get("referals");
        referalls.add(auth.currentUser!.email);


        // update the ref earning
        final body = {
          "referals" : referalls,
          "refEarning": data.get("refEarning") + 1000,
        };

        await profileR.doc(data.id).update(body);
        message = "Ref success";
        state = ViewState.Success;
      }
    } on FirebaseAuthException catch(e){
      message = e.message.toString();
      state = ViewState.Error;
      // print(message);
    } catch(e){
      print(e);
    }


  }
}