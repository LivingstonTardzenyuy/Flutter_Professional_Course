import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media/pages/home_page.dart';
import 'package:social_media/pages/profile_Page.dart';

class MainPage extends StatefulWidget {

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Botton Navigation Container'),
          backgroundColor: Colors.blue,
      ),
      body: pages[currentIndex],    //to allow me to navigate b/t d/f features and see theme
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        type: BottomNavigationBarType.fixed,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'favorite'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Add Post'),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile'),

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
