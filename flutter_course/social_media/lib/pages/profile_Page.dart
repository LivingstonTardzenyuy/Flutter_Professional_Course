import 'package:flutter/material.dart';
import 'package:social_media/config/app_strings.dart';
import 'package:social_media/config/user_avater.dart';

import '../componenets/app_bar.dart';
import '../config/app_routes.dart';
import '../styles/app_text.dart';


enum ProfileMenu{
  edit,
  logout
}

class ProfilePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFile(title: 'Profile', actions: [
        PopupMenuButton<ProfileMenu>(
            onSelected: (value){
              switch(value){
                case ProfileMenu.edit:
                  Navigator.of(context).pushNamed(AppRoutes.editProfile);
                  break;
                case ProfileMenu.logout:
                  print('log out');
                  break;
              }
            },
            itemBuilder: (context){
          return [
            PopupMenuItem(child: Text(AppStrings.edit),
              value: ProfileMenu.edit,
            ),
            PopupMenuItem(child:
                Text(AppStrings.logOut),
              value: ProfileMenu.logout,
            ),
          ];
        })

      ],),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
         children: <Widget>[

           UserAvatar(size: 90,),
          SizedBox(height: 24,),
           Text(
               'Kongnyuy Livingston',
             style: AppText.header2,
           ),
           SizedBox(height: 6),

           SizedBox(width: 8),
           Text(
             'Cameroon',
             style: AppText.subtitle3,
           ),

           SizedBox(height: 24,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: <Widget>[
               Column(
                 children: <Widget>[
                   Text('200', style: AppText.header2,),
                   Text('Followers'),
                 ],
               ),

               Column(
                 children: <Widget>[
                   Text('200', style: AppText.header2,),
                   Text('Posts'),
                 ],
               ),


               Column(
                 children: <Widget>[
                   Text('800', style: AppText.header2,),
                   Text('Following'),
                 ],
               ),

             ],
           ),

           Divider(thickness: 2, height: 30,),
          Text('dfkj')


         ],
      ),
    );
  }
}
