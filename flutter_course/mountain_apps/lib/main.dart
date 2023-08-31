import 'package:flutter/material.dart';
import 'package:mountain_apps/pages/navPages/main_page.dart';
import 'package:mountain_apps/pages/welcome_page.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

        home: MainPage(),
    );
  }
}
