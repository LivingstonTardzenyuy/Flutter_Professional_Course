import 'package:flutter/material.dart';
import 'input_page.dart';
import 'constants.dart';


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
          style: klabelTextStyle,
        )

      ],

    );
  }
}
