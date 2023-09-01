import 'package:flutter/material.dart';
import 'package:mountain_apps/pages/navPages/search_page.dart';

import '../../appResources/strings.dart';
import 'bar_item_page.dart';
import '../home_page.dart';
import 'my_page.dart';


List pages = [
  HomePage(),
  BarItemPage(),
  SearchPage(),
  MyPage(),
];
int currentIndex = 0;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override


  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,

        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        // elevation: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: AppStrings.home),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart_sharp), label: AppStrings.bar),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: AppStrings.search),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: AppStrings.my),

        ]
      ),
    );
  }
}
