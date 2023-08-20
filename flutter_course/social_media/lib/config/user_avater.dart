import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {

  UserAvatar({this.size = 40});
  final double size;


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: Image.asset(
        'assets/temp/na.jpg',
        height: size,
        width: size,
      ),
    );
  }
}
