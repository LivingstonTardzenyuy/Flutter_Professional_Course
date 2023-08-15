import 'package:flutter/material.dart';

final kElevatedButtonNoBorderRadius = ButtonStyle(

  shape: MaterialStateProperty.all<OutlinedBorder>(

    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0),
    ),
  ),
);


final kSocialMediaButtons = ButtonStyle(

  shape: MaterialStateProperty.all<OutlinedBorder>(

    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0),
    ),
  ),
  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),

);

const kWelcomeBack = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);


const kLoginToC = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w700,
  fontSize: 20,
);


const kHomePageTitle = TextStyle(
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.w700,
);