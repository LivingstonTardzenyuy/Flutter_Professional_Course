import 'package:flutter/material.dart';

import '../appResources/appcolors.dart';
import 'app_text.dart';


class AppButtons extends StatelessWidget {

  AppButtons({required this.colour, required this.backgroundColour, required this.size, required this.borderColor, this.text = "Hi", this.icon, this.isIcon = false});
  late Color colour;
  late Color backgroundColour;
  late double size;
  late Color borderColor;
  String? text;
  IconData? icon;
  bool? isIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0
        ),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColour,),

      child: isIcon == false? Center(child: AppText(label: text!, colour: colour)) : Center(child: Icon(icon, color: colour))
    );
  }
}
