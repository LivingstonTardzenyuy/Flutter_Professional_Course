import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(
            bodyLarge : TextStyle(color: Colors.white),
        )
        // accentColor: Colors.purple,
      ),
      home: InputPage(),
    );
  }
}


class InputPage extends StatefulWidget {

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
        body: Center(
          child: Text('Body text'),


        ),

        floatingActionButton: Theme(
          data: ThemeData.light(),
          child: FloatingActionButton(

            onPressed: () {},
            child: Icon(Icons.add),
          ),
        ),

    );
  }
}
