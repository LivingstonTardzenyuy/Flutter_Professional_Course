import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_firestore/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/authentification.dart';
import '../Provider/crudOperationsUsingFirestore.dart';
import '../main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    late FirebaseFirestore firestore = FirebaseFirestore.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.pink,
        actions: [
          Consumer<AuthLoginProviderGoogle>(
            builder: (BuildContext context, logOut, Widget? child) {
              return TextButton(
                onPressed: () async {
                  await logOut.signOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                          (route) => false);
                },
                child: Icon(Icons.logout),
              );
            },
          )
        ],
      ),
      body: Consumer<Crud>(
        builder: (BuildContext context, value, Widget? child) {
          return Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    // Check if the user is authenticated before adding data to Firestore
                    if (AuthService().firebaseAuth.currentUser != null) {
                      await value.GetData();
                    } else {
                      print("User not authenticated");
                    }
                  },
                  child: Text('Add data to Firestore', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                ),
                
                Consumer<Crud>(
                  builder: (BuildContext context, Crud value, Widget? child) {
                    return ElevatedButton(
                        onPressed: () async{
                          await value.GetData();
                        },
                        child: Text("Read data from firestore"));
                  },

                )
              ],
            ),
          );
        },
      ),

    );
  }
}
