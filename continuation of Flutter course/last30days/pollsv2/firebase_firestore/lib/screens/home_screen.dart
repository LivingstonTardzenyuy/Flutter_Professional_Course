import 'dart:math';

import 'package:firebase_firestore/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/authentification.dart';
import '../Provider/crudOperationsUsingFirestore.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()), (route) => false);
                },
                child: Icon(Icons.logout,),
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
                  onPressed: () {
                    value.CrudAdd();
                  },
                  child: Text('Add data to Firestore', style: TextStyle(color: Colors.white),),

                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue
                  ),
                )
              ],
            ),
          );
        },

      ),
    );
  }
}
