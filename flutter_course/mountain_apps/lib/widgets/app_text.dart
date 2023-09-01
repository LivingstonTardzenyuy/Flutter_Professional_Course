import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
 late String label;
 late Color colour;

 AppText({required this.label, required this.colour});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        label,
        style: TextStyle(
          color: colour,
        ),
      )

    );
  }
}


