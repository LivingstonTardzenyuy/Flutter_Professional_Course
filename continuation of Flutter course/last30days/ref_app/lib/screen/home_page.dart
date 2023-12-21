import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ref_app/Utils/message.dart';
import 'package:ref_app/authentication/login_page.dart';
import 'package:share_plus/share_plus.dart';

import '../provider/auth_profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CollectionReference profileRf = FirebaseFirestore.instance.collection("users");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: [
          Consumer<AuthProviderDb>(
            builder: (BuildContext context, AuthProviderDb value, Widget? child) {
              return IconButton(
                  onPressed: () {
                    value.logout();
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login()), (route) => false);
                  },
                  icon: Icon(Icons.exit_to_app, color: Colors.white,));
            },

          )
        ],
      ),

      body: FutureBuilder<QuerySnapshot>(
        future: profileRf.where("refCode", isEqualTo: FirebaseAuth.instance.currentUser!.uid).get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
          if(!snapshot.hasData){
            return const Center(child: CircularProgressIndicator(),);
          }

          final data = snapshot.data!.docs[0];
          final earning = data.get("refEarning");
          List referalList = data.get("referals");
          final refCode = data.get("refCode");


          return Container(
            padding: const EdgeInsets.all(20),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                      children: [
                        Card(
                          child: ListTile(
                            title: const Text("Earning", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
                            subtitle: Text("CMR, $earning fcfa", style: TextStyle(fontSize: 18),),
                          ),
                        ),
                        SizedBox(height: 5,),
                        Divider(thickness: 3,),
                        SizedBox(height: 5,),
                        Card(
                          child: ListTile(
                            title: const Text("Referal Code", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
                            subtitle: Text("$refCode"),
                            trailing: IconButton(
                              onPressed: () {
                                ClipboardData data = ClipboardData(text: refCode);
                                Clipboard.setData(data);
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(refCode), backgroundColor: Colors.purple,));
                              },
                              icon: Icon(Icons.copy),
                            ),
                          ),
                        ),

                        SizedBox(height: 5,),
                        Divider(thickness: 3,),
                        SizedBox(height: 5,),
                        Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: const Text("Invite your friends to the app and earn 10,000 fcfa when they register using your Rerefal code"),
                              ),
                              Container(
                                child: TextButton(
                                  onPressed: () {
                                    String shareLink = "Hey! use this app and earn 1000 CFA ($refCode)";

                                    Share.share(shareLink);
                                  },
                                  child: Text("Share link"),
                                ),
                              )
                            ],
                          ),
                        ),

                        SizedBox(height: 5,),
                        Divider(thickness: 3,),
                        SizedBox(height: 5,),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Referals"),
                              Text("${referalList.length.toString()}"),
                            ],
                          ),
                        ),

                        if (referalList.isEmpty) const Text("No Referals"),
                        ...List.generate(referalList.length, (index) {
                          final data = referalList[index];
                          return Container(
                            height: 50.0,
                            margin: const EdgeInsets.only(bottom: 10),
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Text("$index + 1"),
                              ),
                              title: Text(data),
                            ),
                          );
                        })

                      ]

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
