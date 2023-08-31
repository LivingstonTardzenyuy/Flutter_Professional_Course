import 'package:flutter/material.dart';
import 'package:social_media/componenets/app_bar.dart';
import 'package:social_media/componenets/post_items.dart';
import 'package:social_media/constants.dart';
import 'package:social_media/styles/app_colors.dart';
import 'package:social_media/styles/styleInput.dart';
import 'package:social_media/styles/app_text.dart';

import '../config/app_routes.dart';
import '../config/app_strings.dart';
class HomePage extends StatelessWidget {
  List<String> users = [];

  @override
  Widget build(BuildContext context) {
    mockUsersFromServer();
    return Scaffold(
      body: Scaffold(
        appBar: AppBarFile(title: AppStrings.appName, actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.nearby);
            },
              icon:Icon(Icons.location_on),
          ),
        ],),
        body: ListView.separated(
          itemBuilder: (context, index){
          return PostItem(user: users[index]);
        },
        itemCount: users.length,
          separatorBuilder: (BuildContext context, int index){
            return SizedBox(
              height: 24.0,
            );
            },
        ),
      ),
    );
  }


  mockUsersFromServer(){
    for (var i = 0; i< 100; i++){
      users.add('User number $i');

    }
  }
}


