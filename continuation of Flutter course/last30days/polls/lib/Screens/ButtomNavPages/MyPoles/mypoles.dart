import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polls/Utils/message.dart';
import 'package:polls/Utils/router.dart';
import 'package:provider/provider.dart';

import '../../../Provider/db_provider.dart';
import '../../../Provider/fetch_polls.dart';
import '../../../Styles/colors.dart';
import 'add_new_poles.dart';


class MyPolls extends StatefulWidget {
  const MyPolls({Key? key}) : super(key: key);

  @override
  State<MyPolls> createState() => _MyPollsState();
}

class _MyPollsState extends State<MyPolls> {
  void deletePoll(String pollId) {
    // Implement the logic to delete the poll using the pollId
    // For example, using the Firestore delete operation:
    FirebaseFirestore.instance.collection('polls').doc(pollId).delete().then(
          (value) {
        // Poll deleted successfully
        // You can update the state or show a success message if needed
      },
    ).catchError(
          (error) {
        // An error occurred while deleting the poll
        // You can handle the error or show an error message
      },
    );
  }

  void _showAlertDialog(BuildContext context, String pollId) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text(
          'Alert',
          style: TextStyle(color: Colors.red, fontSize: 20),
        ),
        content: const Text('Are you sure you want to delete this poll?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              // Call the method to delete the poll using the pollId
              deletePoll(pollId);
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  bool _isFetched = false;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text("Your Polls", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 28),)),
      ),
      body: Consumer<FetchPollsProvider>(
        builder: (BuildContext context, FetchPollsProvider polls, Widget? child) {
          if (_isFetched == false) {
            // to avoid over fetching.
            polls.fetchUserPolls();
            Future.delayed(const Duration(microseconds: 1), () {
              _isFetched = true;
            });
          }
          return SafeArea(
            child: polls.isLoading == true
                ? CircularProgressIndicator()
                : polls.userPollProvider.isEmpty
                ? const Center(child: Text("You don't have any poll yet."))
                : CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        ...List.generate(polls.userPollProvider.length, (index) {
                          final data = polls.userPollProvider[index];

                          // Perform null checks to handle potential null values
                          Map author = data["author"] ?? {};
                          Map poll = data["poll"] ?? {};
                          List<dynamic> options = poll["options"] ?? [];

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
                                    backgroundImage: NetworkImage(author["profileImage"] ?? ""),
                                  ),
                                  title: Text(author["name"] ?? "Unknown"),
                                  trailing: Consumer<DbProvider>(
                                    builder: (BuildContext context, pollDelete, child) {
                                      return IconButton(
                                        onPressed: pollDelete.status == true
                                            ? null
                                            : () {
                                          _showAlertDialog(context, data.id!); // Assuming id cannot be null
                                        },
                                        icon: pollDelete.status == true ? CircularProgressIndicator() : Icon(Icons.delete),
                                      );
                                    },
                                  ),
                                ),
                                Text(poll["question"] ?? "No question available", style: TextStyle(fontWeight: FontWeight.w600),),
                                const SizedBox(height: 8.0,),
                                ...List.generate(options.length, (index) {
                                  final dataOptions = options[index];

                                  return Consumer<FetchPollsProvider>(
                                    builder: (context, poll, child) {
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
                                                    value: dataOptions["percent"] / 100,
                                                  ),
                                                  Container(
                                                    alignment: Alignment.centerLeft,
                                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                                    height: 30,
                                                    child: Text(dataOptions["answer"] ?? "No answer available"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 20,),
                                            Text("${dataOptions["percent"]}%"),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                }),
                                Text('Total votes: ${poll["total_votes"] ?? ""}'),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          nextPage(context, AddPollPage());
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.white,),
        shape: CircleBorder(),
      ),
    );
  }
}
