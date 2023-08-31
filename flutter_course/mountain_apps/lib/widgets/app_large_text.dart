import 'package:flutter/material.dart';


class AppLargeText extends StatelessWidget {

  AppLargeText({required this.size, required this.text, required this.colour, required this.isBold});
  double size = 30;
  late String text;
  Color colour = Colors.black;
  late bool isBold;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: colour,
        fontSize: size,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}


