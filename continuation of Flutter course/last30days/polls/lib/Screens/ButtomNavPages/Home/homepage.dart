import 'package:flutter/material.dart';

import '../../../Styles/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                                icon: Icon(Icons.share),
                              ),
                            ),

                            const Text('My Question'),
                            const SizedBox(height: 8.0,),

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
      )
    );
  }
}
