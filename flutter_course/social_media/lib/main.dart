import 'package:flutter/material.dart';
import 'package:social_media/pages/edit_profile_page.dart';
import 'config/app_routes.dart';
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
        scaffoldBackgroundColor: AppColors.backgroundColor,
        brightness: Brightness.dark,
      ),

        initialRoute: AppRoutes.login,
        routes: AppRoutes.pages,
    );
  }
}
