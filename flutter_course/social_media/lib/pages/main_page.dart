import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media/pages/home_page.dart';
import 'package:social_media/pages/profile_Page.dart';

import '../config/appIconsAndImages.dart';
import '../config/app_strings.dart';
import '../styles/app_colors.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Menus currentIndex = Menus.home;

  final pages = [
    HomePage(),
    Center(child: Text('favorite')),
    Center(child: Text('add post'),),
    Center(child: Text('messages'),),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      body: pages[currentIndex.index],
      bottomNavigationBar: MyButtonNavigation(
        currentIndex: currentIndex.index,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}

enum Menus{
  home, favorite, add, message, user
}

class MyButtonNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<Menus> onTap;

  MyButtonNavigation({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87,
      margin: EdgeInsets.all(24),
      child: Stack(
        children: <Widget>[
          Positioned(
            right: 0, left: 0,top: 17,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: IconButton(
                      onPressed: () => onTap(Menus.home),
                      icon: AppIcons.home,
                      color: currentIndex == Menus.home ? Colors.blue : null

                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () => onTap(Menus.favorite),
                      icon: AppIcons.favorite,
                        color: currentIndex == Menus.favorite ? Colors.blue : null

                    ),
                  ),
                  Expanded(child: Container(),),
                  Spacer(),
                  Expanded(
                    child: IconButton(
                      onPressed: () => onTap(Menus.message),
                      icon: AppIcons.message,
                        color: currentIndex == Menus.message ? Colors.blue : null

                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () => onTap(Menus.user),
                      icon: AppIcons.profile,
                        color: currentIndex == Menus.user ? Colors.blue : null

                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0, right: 0, top: 0,
            child: GestureDetector(
              onTap: () => onTap(Menus.add),
              child: Container(
                width: 64,
                height: 64,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: AppIcons.add,
              ),
            ),
          ),
        ],
      ),
    );
  }
}