import 'package:flutter/material.dart';
import 'input_page.dart';

const labelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF808E98),
);

const sizeIcon = 80.0;

class ReusableStyle extends StatelessWidget {

  final IconData? icon;
  final String label;

  ReusableStyle({this.icon,required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: sizeIcon

        ),

        SizedBox(height: 20.0),

        Text(
          label,
          style: labelTextStyle,
        )

      ],

    );
  }
}
