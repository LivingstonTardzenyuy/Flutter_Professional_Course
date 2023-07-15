import 'package:flutter/material.dart';
import 'constant.dart';
import 'resuable.dart';


// void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  MyApp({this.bmiResult = '', this.resultText='', this.interpretation = ''});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('BMI Results')
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                  'Your results',
                style: kYourResults,
              ),
            ),
          ),

          Expanded(
            flex: 5,
            child: ResusableCard(
                colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                      resultText,
                    style: klabelHeight,
                    textAlign: TextAlign.center,
                  ),

                  Text(
                      bmiResult,
                    style: kBMIResults,
                    textAlign: TextAlign.center,
                  ),

                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                  ),

                ],
              ),

            ),

          ),

          TextButton(
              onPressed: () {},
              child: Text('ReCalculate'))

        ],
      ),
    );
  }
}
