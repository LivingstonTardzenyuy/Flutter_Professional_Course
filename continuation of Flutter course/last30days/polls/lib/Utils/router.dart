import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void nextPage(BuildContext context, Widget page) {
  Navigator.push(context, CupertinoPageRoute(builder: (context) => page));
}

void nextPageOnly(BuildContext context, Widget page) {
  Navigator.pushAndRemoveUntil(
      context, CupertinoPageRoute(builder: (context) => page), (route) => false);
}
