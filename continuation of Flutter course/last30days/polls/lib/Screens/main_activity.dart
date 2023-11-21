import 'package:flutter/material.dart';
import 'package:polls/Screens/ButtomNavPages/Home/homepage.dart';
import 'package:polls/Screens/ButtomNavPages/MyPoles/mypoles.dart';
import 'package:polls/Screens/ButtomNavPages/Profile/accounts.dart';
import 'package:provider/provider.dart';

import '../Provider/bottom_nav_provider.dart';

class MainActivityPage extends StatefulWidget {
  @override
  State<MainActivityPage> createState() => _MainActivityPageState();
}

class _MainActivityPageState extends State<MainActivityPage> {
 int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(
      builder: (BuildContext context, BottomNavProvider nav, Widget? child) {

      return Scaffold(
        body: _pages[nav.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: _items,
        currentIndex: nav.currentIndex,
        onTap: (value) {
            nav.changeIndex = value;
        },),
      );
      },
    );
  }

  List<Widget> _pages = [
    MyPolls(),
    MyPolls(),
    AccountPage(),
  ];

  List<BottomNavigationBarItem> _items =[
    BottomNavigationBarItem(icon: Icon(Icons.home,), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.poll,), label: 'Poll'),
    BottomNavigationBarItem(icon: Icon(Icons.person,), label: 'Person'),

  ];
}
