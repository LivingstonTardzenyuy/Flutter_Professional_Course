import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media/pages/home_page.dart';
import 'package:social_media/pages/profile_Page.dart';

import '../config/appIconsAndImages.dart';
import '../config/app_strings.dart';

class MainPage extends StatefulWidget {

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],    //to allow me to navigate b/t d/f features and see theme
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        type: BottomNavigationBarType.fixed,
        items: [
        BottomNavigationBarItem(icon: AppIcons.home, label: AppStrings.home),
        BottomNavigationBarItem(icon: AppIcons.favorite, label: AppStrings.favourite),
        BottomNavigationBarItem(icon: AppIcons.message, label: AppStrings.message),
        BottomNavigationBarItem(icon: AppIcons.message, label: AppStrings.add),
        BottomNavigationBarItem(icon: AppIcons.account_cirlce, label: AppStrings.profile),

        ],

        currentIndex: currentIndex,
        onTap: (index){
        setState(() {
          currentIndex = index;

        });

        },
      ),
    );
  }

  final pages = [
    HomePage(),
    Center(child: Text('favorite')),
    Center(child: Text('add post'),),
    Center(child: Text('messages'),),

    ProfilePage(),
  ];
}
