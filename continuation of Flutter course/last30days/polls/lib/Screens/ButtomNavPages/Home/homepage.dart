import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Provider/fetch_polls.dart';
import '../../../Styles/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isFetched = false;         // to prevent overfetching
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FetchPollsProvider>(
        builder: (BuildContext context, FetchPollsProvider polls, Widget? child) {
          if (_isFetched == false){                                         // to aviod over fetching.
            polls.fetchAllPolls();
            Future.delayed(Duration(microseconds: 1), (){
              _isFetched = true;
            });
          }
          return SafeArea(
            child: polls.isLoading == true ?  CircularProgressIndicator() :
            polls.pollList.isEmpty ? const Center(child: Text("No poll at the moment"),) :
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        ...List.generate(polls.pollList.length, (index) {
                          final data = polls.pollList[index];         //getting indidual items from db
                          log(data.data().toString());
                          Map author = data["author"];
                          Map poll = data["poll"];
                          Timestamp date = data["dateCreated"];

                          // List<dynamic> options = poll["options"];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  contentPadding: const EdgeInsets.all(0),

                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(author["profileImage"]),
                                  ),
                                  title: Text(author["name"]),
                                  trailing: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.share),
                                  ),
                                ),

                                Text(poll["questions"]),
                                const SizedBox(height: 8.0,),
                                const Text('Total Votes: 8'),

                                ...List.generate(2, (index) {
                                  // final dataOptions = options[index];
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 5, right: 20),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Stack(
                                            children: [
                                              LinearProgressIndicator(
                                                minHeight: 30.0,
                                                backgroundColor: AppColors.white,
                                                value: 50 / 100,
                                              ),
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                                height: 30,
                                                child: Text("answer"),
                                              ),
                                            ],
                                          ),
                                        ),

                                        SizedBox(width: 20,),
                                        Text('5%'),
                                      ],
                                    ),
                                  );
                                }),

                                Text('Total votes: ${poll["total_votes"]}')
                              ],
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },

      )
    );
  }
}
