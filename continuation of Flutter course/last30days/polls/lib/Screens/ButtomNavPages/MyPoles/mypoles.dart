import 'package:flutter/material.dart';
import 'package:polls/Utils/router.dart';

import '../../../Styles/colors.dart';
import 'add_new_poles.dart';

class MyPolls extends StatefulWidget {
  const MyPolls({super.key});

  @override
  State<MyPolls> createState() => _MyPollsState();
}

class _MyPollsState extends State<MyPolls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      ...List.generate(3, (index) {
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

                                leading: CircleAvatar(),
                                title: Text('John Paul'),
                                trailing: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.delete),
                                ),
                              ),

                              const Text('My Question'),
                              const SizedBox(height: 8.0,),
                              const Text('Total Votes: 8'),

                              ...List.generate(2, (index) {
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
                                              child: Text('Destiny'),
                                            ),
                                          ],
                                        ),
                                      ),

                                      SizedBox(width: 20,),
                                      Text('5%'),
                                    ],
                                  ),
                                );
                              })


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
        ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          nextPage(context, AddPollPage());
        },
          backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.white,),
        shape: CircleBorder()
      ),
    );
  }
}
