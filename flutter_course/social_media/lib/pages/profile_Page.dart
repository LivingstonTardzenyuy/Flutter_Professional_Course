import 'package:flutter/material.dart';
class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
         children: <Widget>[
             Center(
               child: Padding(
                 padding:EdgeInsets.only(top: 14),
                 child: Container(
                   width: 90,
                   height: 90,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(20.0)
                   ),
                   child: Image.asset(
                       'assets/temp/na.jpg',

                   ),
                 ),
               ),
             ),

         ],
      ),
    );
  }
}
