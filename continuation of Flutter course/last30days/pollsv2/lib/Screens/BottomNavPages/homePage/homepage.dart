import 'package:flutter/material.dart';

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
                        child: Column(
                          children: [
                            ListTile(
                              // contentPadding:
                              leading: CircleAvatar(),
                              title: Text("Kongnyuy Livingston"),
                              trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.share),
                              )
                              ,
                            )
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
