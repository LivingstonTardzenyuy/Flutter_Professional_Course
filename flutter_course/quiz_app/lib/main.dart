import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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

  int finalScore = 0;


  void checkAnswer(bool usersAnswer){
    bool correctAnswer = quizBrain.getQuestionAnswer();

    setState(() {
      if(quizBrain.isFinished() == true){
        quizBrain.reset();
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz. your score was $finalScore',
        ).show();


        scoreKeeper = [];

      }

      else {


        if (usersAnswer == correctAnswer) {
          finalScore ++;
          print(' you final score is $finalScore');
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,

            ),

          );
        }
        else {
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }

        quizBrain.nextQuestion();
      }



    });

  }



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
                checkAnswer(true);
                }

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
                checkAnswer(false);

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
