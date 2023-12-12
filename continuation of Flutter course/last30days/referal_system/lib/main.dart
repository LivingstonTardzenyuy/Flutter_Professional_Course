import 'package:flutter/material.dart';
import 'package:referal_app/screen/splash.dart';

void main() {
  runApp(ReferalApp());
}

class ReferalApp extends StatelessWidget {
  const ReferalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
