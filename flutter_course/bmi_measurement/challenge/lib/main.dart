import 'package:flutter/material.dart';
import 'input_page.dart';
import 'bmiresults.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E90),
        scaffoldBackgroundColor: Color(0xFF0A0E21),

      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/results': (context) => MyApp(),
      },

    );

  }
}
