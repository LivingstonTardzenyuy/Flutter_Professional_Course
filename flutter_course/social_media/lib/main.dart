import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'styles/app_colors.dart';
import 'pages/home_page.dart';
import 'pages/main_page.dart';
import 'pages/test_page.dart';
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor
      ),

      // home: TestPage(),
      initialRoute: '/main',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/main': (context) => MainPage(),

      },
    );
  }
}
