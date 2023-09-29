import 'package:flutter/material.dart';
import 'package:instagram_clone_with_firebase/responsive/mobile_screen_layout.dart';
import 'package:instagram_clone_with_firebase/responsive/responsive_layout_screen.dart';
import 'package:instagram_clone_with_firebase/responsive/web_screen_layout.dart';
import 'package:instagram_clone_with_firebase/utils/colors.dart';
import 'package:instagram_clone_with_firebase/responsive/responsive_layout_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Intagram clone",
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.mobileBackgroundColor
      ),
      home: ResponsiveLayout(mobileScreenLayout: MobileScreenLayout() , webScreenLayout: WebScreenLayout()),
    );
  }
}
