import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_firestore/screens/models/notes.dart';
import 'package:firebase_firestore/screens/notes/add_note.dart';
import 'package:firebase_firestore/screens/notes/edit_notes.dart';
import 'package:firebase_firestore/screens/register_screen.dart';
import 'package:firebase_firestore/screens/upload_image.dart';
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
        backgroundColor: Colors.teal,
        title: Text("Home"),
        centerTitle: true,
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
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => UploadImageScreen()));
            },
            child: Text("Images "),
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("notes").where("userID", isEqualTo: user!.uid).snapshots(),
        builder: (context, AsyncSnapshot snapshot){
          if (snapshot.hasData){
            if(snapshot.data.docs.length > 0){
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index){
                    NoteModel note = NoteModel.fromJson(snapshot.data.docs[index]);       //converting json to object
                    return Card(
                      color: Colors.blueAccent,
                      elevation: 5,
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        title: Text(note.title, style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15
                        ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(note.description, overflow: TextOverflow.ellipsis, maxLines: 10,),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditNoteScreen(note: note,)));
                        },
                      ),

                    );
                  });
            } else {
              return Center(
                child: Text("No Notes yet."),
              );
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      )

    );
  }
}


// ListView(
// children: [
// Card(
// color: Colors.pink,
// elevation: 5,
// margin: const EdgeInsets.all(10),
// child: ListTile(
// contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
// title: Text("Build a new App", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
// subtitle: Text("Learn the build a clean of clubHouse application from Udemy", overflow: TextOverflow.ellipsis, maxLines: 2,),
// onTap: () {
// Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditNoteScreen()));
// }
// ,
// ),
// )
// ],
// )