import 'package:flutter/material.dart';


class AppLargeText extends StatelessWidget {

  AppLargeText({required this.size, required this.text, required this.colour});
  double size = 30;
  late String text;
  Color colour = Colors.black;


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: colour,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}


