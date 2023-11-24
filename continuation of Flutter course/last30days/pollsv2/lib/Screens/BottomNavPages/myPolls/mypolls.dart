import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pollsv2/Utils/messages.dart';
import 'package:pollsv2/Utils/router.dart';
import 'package:provider/provider.dart';

import '../../../Provider/db_provider.dart';
import '../../../Provider/fetch_polls_provider.dart';
import '../../../Styles/colors.dart';
import 'add_new_polls.dart';

class MyPoles extends StatefulWidget {
  // const HomePage.HomePage({super.key});

  @override
  State<MyPoles> createState() => _MyPolesState();
}

class _MyPolesState extends State<MyPoles> {
  bool _isFetched = false;

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Alert'),
        content: const Text('Proceed with destructive action?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            /// This parameter indicates this action is the default,
            /// and turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as deletion, and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            nextPage(context, AddPollPage());
          },
          child: Icon(Icons.add, color: Colors.white,),
          shape: CircleBorder(),
          backgroundColor: Colors.blue,
        ),
          body: Consumer<FetchPollsProvider>(
            builder: (BuildContext context, polls, child){
              if(_isFetched == false){                          // allow the polls to be fetch only once...
                polls.fetchUserPolls();
                Future.delayed(const Duration(microseconds: 1), () {
                  _isFetched = true;
                });
              }
              return polls.isLoading == true ? const Center(
                child: CircularProgressIndicator(),
              ) : polls.usersList.isEmpty ? const Center(child: Text('No polls found')) :

              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                      child: Container(
                        padding:  const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            ...List.generate(polls.usersList.length, (index) {
                              final pollData = polls.usersList[index];          //getting individual data from our db

                              //accessing the data from backEnd.
                              log(pollData.data().toString());      //diplaying data in console.
                              Map author = pollData["author"];
                              Map poll = pollData["poll"];
                              Timestamp date = pollData['dateCreated'];
                              String formattedDate = DateFormat('EEE,yyyy-MM-dd').format(date.toDate());

                              List<dynamic>  options = poll['options'];

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
                                      // contentPadding:
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(author['profileImage']),
                                        backgroundColor: Colors.blue,),
                                      title: Text(author["name"], style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
                                      subtitle: Text(formattedDate),
                                      trailing: Consumer<ProviderPro>(
                                        builder: (BuildContext context, deletePoll, child) {
                                          WidgetsBinding.instance.addPostFrameCallback((_) {
                                            if(deletePoll.message != ""){
                                              if (deletePoll.message.contains('Poll Deleted')){
                                                success(context, message: deletePoll.message);
                                                deletePoll.clear();
                                              } else{
                                                error(context, message: deletePoll.message);
                                                polls.fetchUserPolls();
                                                deletePoll.clear();
                                              }
                                            }
                                          });
                                          return IconButton(
                                            onPressed: deletePoll.status == true ? null :
                                                () {
                                              deletePoll.deletePoll(pollId: pollData.id);
                                            },
                                            icon: deletePoll.status == true ? CircularProgressIndicator() : Icon(Icons.delete),
                                          );
                                        },

                                      )
                                      ,
                                    ),

                                    Text(poll["questions"]),
                                    const SizedBox(height: 8,),
                                    ...List.generate(options.length, (index) {
                                      final dataOptions = options[index];         // print out users particular answer.

                                      return Container(
                                        padding: const EdgeInsets.only(bottom: 5, right: 30),

                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Stack(
                                                children: [
                                                  LinearProgressIndicator(
                                                    minHeight: 30,
                                                    backgroundColor: AppColors.white,
                                                    value: dataOptions['percent'] / 100,
                                                  ),
                                                  Container(
                                                    alignment: Alignment.centerLeft,
                                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                                    height: 30,

                                                    child: Text(dataOptions['answer']),
                                                  )
                                                ],
                                              ),
                                            ),

                                            Text("${dataOptions['percent']}%")
                                          ],
                                        ),
                                      );
                                    }),
                                    Text("Total votes: ${poll['total_votes'].toString()}"),

                                  ],
                                ),
                              );
                            })
                          ],
                        ),
                      )
                  ),
                ],
              );
            },

          )
      ),
    );
  }
}
