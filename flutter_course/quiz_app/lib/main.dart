import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizzBrain quizBrain = QuizzBrain();

void main() => runApp(Quizapp());

class Quizapp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade500,
        body:SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {


  List<Widget> scoreKeeper = [

  ];





  @override
  Widget build(BuildContext context) {


    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),

                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,

                ),
              ),
            ),
          ),
        ),


        Expanded(
          child: Container(
            padding: EdgeInsets.all(15.0),
            margin: EdgeInsets.all(10.0),
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: Text(
                'True',

                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {

                bool correctAnswer = quizBrain.getQuestionAnswer();

                if (correctAnswer == true){
                  print("users got it right");

                }
                else{
                  print('users got it wrong');
                }

                setState(() {
                  quizBrain.nextQuestion();
                });
              },
            ),
          ),
        ),


        SizedBox(height: 2.0),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {


              },
            ),
          ),
        ),

        Row(
          children: scoreKeeper,

        ),

      ],
    );  


  }
}
