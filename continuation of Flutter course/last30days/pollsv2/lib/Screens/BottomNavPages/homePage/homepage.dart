import 'package:flutter/material.dart';

import '../../../Styles/colors.dart';

class HomePage extends StatefulWidget {
  // const HomePage.HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding:  const EdgeInsets.all(20),
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
                              // contentPadding:
                              leading: CircleAvatar(backgroundColor: Colors.blue,),
                              title: Text("Kongnyuy Livingston"),
                              trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.share),
                              )
                              ,
                            ),

                            Text('My Question'),
                            const SizedBox(height: 8,),
                            ...List.generate(2, (index) {
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
                                              value: 0.4,
                                            ),
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              padding: const EdgeInsets.symmetric(horizontal: 10),
                                              height: 30,

                                              child: Text('My Questtion'),
                                            )
                                          ],
                                        ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                            const Text('Total Votes'),

                          ],
                        ),
                      );
                    })
                  ],
                ),
              )
            )
          ],
        )
      ),
    );
  }
}
