import 'package:flutter/material.dart';

import '../styles/app_text.dart';
class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
         children: <Widget>[
             Image.asset(
                 'assets/temp/na.jpg',
               height: 90,
               width: 90,
             ),
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
