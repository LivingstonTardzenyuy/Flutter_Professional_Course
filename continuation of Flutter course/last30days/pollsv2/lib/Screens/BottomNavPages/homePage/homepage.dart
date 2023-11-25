import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pollsv2/Utils/messages.dart';
import 'package:provider/provider.dart';

import '../../../Provider/db_provider.dart';
import '../../../Provider/fetch_polls_provider.dart';
import '../../../Styles/colors.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isFetched = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<FetchPollsProvider>(
          builder: (BuildContext context, polls, child) {
            if (_isFetched == false) {
              polls.fetchAllPolls();
              Future.delayed(const Duration(microseconds: 1), () {
                _isFetched = true;
              });
            }
            return polls.isLoading == true
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : polls.pollsList.isEmpty
                ? const Center(child: Text('No polls found'))
                : CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        ...List.generate(polls.pollsList.length, (index) {
                          final pollData = polls.pollsList[index];
                          Map author = pollData["author"];
                          Map poll = pollData["poll"];
                          Timestamp date = pollData['dateCreated'];
                          List voters = poll["voteers"];
                          String formattedDate =
                          DateFormat('EEE,yyyy-MM-dd').format(date.toDate());

                          List<dynamic> options = poll['options'];

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
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(author['profileImage']),
                                    backgroundColor: Colors.blue,
                                  ),
                                  title: Text(
                                    author["name"],
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                                  ),
                                  subtitle: Text(formattedDate),
                                  trailing: IconButton(
                                    onPressed: () {
                                      // Add your action here
                                    },
                                    icon: Icon(Icons.share),
                                  ),
                                ),
                                Text(poll["questions"]),
                                const SizedBox(height: 8,),
                                ...List.generate(options.length, (index) {
                                  final dataOptions = options[index];

                                  return Consumer<ProviderPro>(
                                    builder: (BuildContext context, pollVote, Widget? child) {
                                      WidgetsBinding.instance!.addPostFrameCallback((_) {
                                        if (pollVote.message.isNotEmpty) {
                                          if (pollVote.message.contains("Vote recorded")) {
                                            success(context, message: pollVote.message);
                                            pollVote.clear();
                                          } else {
                                            error(context, message: pollVote.message);
                                            pollVote.clear();
                                          }
                                        }
                                      });
                                      return GestureDetector(
                                        onTap: () {
                                          log(dataOptions.toString());
                                          if (voters.isEmpty) {
                                            log("no vote for now");
                                            pollVote.votePoll(
                                              pollId: pollData.id,
                                              pollData: pollData,
                                              previousTotalVotes: poll["total_votes"],
                                              seletedOptions: dataOptions["answer"],
                                            );
                                            polls.fetchAllPolls();
                                          }
                                        },
                                        child: Container(
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
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text("${dataOptions['percent']}%")
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }),
                                Text("Total votes: ${poll['total_votes'].toString()}"),
                              ],
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
