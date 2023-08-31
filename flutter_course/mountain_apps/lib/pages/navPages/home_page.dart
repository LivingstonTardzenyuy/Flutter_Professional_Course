
import 'package:flutter/material.dart';
import 'package:mountain_apps/widgets/app_large_text.dart';

import '../../appResources/strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20),
              child: Row(
                children: <Widget>[
                  Icon(Icons.menu, size:30, color:Colors.black54),

                  Expanded(child: Container()),
                  Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5)
                    ),
                  )
                ],
              )
          ),

          SizedBox(height: 40,),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(size: 25, text: 'Discover', colour: Colors.black54, isBold: true),
          ),

          SizedBox(height: 30,),
          Row(
            children: <Widget>[
              Container(
                child: TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(text: AppStrings.places),
                    Tab(text: AppStrings.inspiration),
                    Tab(text: AppStrings.emotions),
                  ]
                )
              ),

              Container(
                height: 300,
                width: double.maxFinite,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Text('hi'),
                    Text('There'),
                    Text('Bye'),

                  ],
                )
              )
            ],
          )
        ],
      ),
    );
  }
}
