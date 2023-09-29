import 'dart:ui';
import 'package:flutter/material.dart';

const Color blushClr = Color(0xFF4e5ae8);
const Color yellowClr = Color(0xFFFFb746);
const Color pinkClr = Color(0xFFff5447);
const Color white = Colors.white;
const primaryClr = blushClr;
const Color darkGreyClr = Color(0xFF434343);

class Themes{
  static final light = ThemeData(
  primaryColor: primaryClr,
  brightness: Brightness.light
  );

  static final dark =  ThemeData(
  primaryColor: darkGreyClr,
  brightness: Brightness.dark,
  );

}