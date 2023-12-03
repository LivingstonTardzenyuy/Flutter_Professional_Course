import 'package:flutter/material.dart';
import 'package:oop/routes.dart';

import 'Screens/welcome_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: ChatRoutes.welcome_screen,
      routes: ChatRoutes.allRoutes,
    );
  }
}