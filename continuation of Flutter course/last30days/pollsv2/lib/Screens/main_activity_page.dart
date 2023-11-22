import 'package:flutter/material.dart';
import 'package:pollsv2/Screens/BottomNavPages/account/account.dart';
import 'package:pollsv2/Screens/BottomNavPages/homePage/homepage.dart';
import 'package:pollsv2/Screens/BottomNavPages/myPolls/mypolls.dart';
import 'package:provider/provider.dart';

import '../Provider/botton_nav_provider.dart';

class MainActivity extends StatefulWidget {
  // const MainActivity({super.key});

  @override
  State<MainActivity> createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottonNavProvider>(
      builder: (BuildContext context, nav, child){
        return Scaffold(
          body: _pages[nav.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              items: _items,
              currentIndex: nav.currentIndex,
              onTap: (value) {
                nav.changeValue = value;
              }
          ),
        );
      },

    );
  }

  List<Widget> _pages = [
    HomePage(),
    MyPoles(),
    Account(),
  ];

  List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.poll), label: 'Polls'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'account'),
  ];
}
