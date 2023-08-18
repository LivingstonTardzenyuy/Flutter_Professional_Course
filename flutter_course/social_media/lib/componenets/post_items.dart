import 'package:flutter/material.dart';
import '../styles/app_text.dart';

class PostItem extends StatelessWidget {

  PostItem({required this.user});
  late String user;
  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0,),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Image.asset(
                  'assets/temp/na.jpg',
                  width: 40,
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 19.0),
                  child: Text(
                    user, style: AppText.subtitle3,),
                )

              ],
            ),

            SizedBox(height: 12.0,),
            Container(
              width: double.infinity,
              child: Image.asset(
                  'assets/temp/zz.jpeg',
                fit: BoxFit.fitWidth,
              ),
            ),

            SizedBox(height: 15),
            Text('I am proud to be developing my Apps using Flutter.. I build Apps using Flutter and Django')
          ],
        ),
      );
    }
  }

