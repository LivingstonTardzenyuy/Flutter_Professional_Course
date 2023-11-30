import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_firestore/screens/notes/add_note.dart';
import 'package:firebase_firestore/screens/notes/edit_notes.dart';
import 'package:firebase_firestore/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/authentification.dart';
import '../Provider/crudOperationsUsingFirestore.dart';
import '../main.dart';

class HomeScreen extends StatelessWidget {
  User? user;
  HomeScreen({required this.user});

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
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        shape: CircleBorder(),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddNoteScreen(user: user!,)));
        },
        child: Icon(Icons.add),
      ),
      body: ListView(
        children: [
          Card(
            color: Colors.pink,
            elevation: 5,
            margin: const EdgeInsets.all(10),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              title: Text("Build a new App", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
              subtitle: Text("Learn the build a clean of clubHouse application from Udemy", overflow: TextOverflow.ellipsis, maxLines: 2,),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditNoteScreen()));
              }
              ,
            ),
          )
        ],
      )

    );
  }
}
