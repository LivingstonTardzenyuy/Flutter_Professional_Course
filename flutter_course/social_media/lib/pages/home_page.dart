import 'package:flutter/material.dart';
import 'package:social_media/constants.dart';
import 'package:social_media/styles/app_colors.dart';
import 'package:social_media/styles/styleInput.dart';
class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: Text(
              'Your Dashboard',
            style: kHomePageTitle,
          ),
          actions: [
            Icon(Icons.location_on_outlined),
          ],
          backgroundColor: AppColors.backgroundColor,
          foregroundColor: Colors.white,
        ),
        body: ListView(
          children: mockUsersFromServer(),
        )
      ),
    );
  }

  _userItem() {
    return Row(
      children: <Widget>[
        Image.asset(
          'assets/temp/na.jpg',
          width: 40,
          height: 40,
        ),
        Text(
            'Kongnyuy Livingston')

      ],
    );
  }

  List<Widget> mockUsersFromServer(){
    List<Widget> users = [];
    for (var i = 0; i< 2995; i++){
      users.add(_userItem());

    }
    return users;
  }
}


