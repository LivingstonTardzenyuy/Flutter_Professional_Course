import 'package:flutter/material.dart';
import 'quiz_brain.dart';


void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
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

  List<Widget> scoreKeeper = [];

  List<bool> answersQuestions = [
    false,
    true,
    true,
  ];

  QrizBrain quizBrian = QrizBrain();


  void checkAnswer(bool userPickedAnswer){
    bool correctAnswer = quizBrian.getQuestionAnswer();

    if (correctAnswer == userPickedAnswer) {
      setState(() {
        quizBrian.nextQuestion();
        scoreKeeper.add(
          Icon(

            Icons.check,
            color: Colors.green,
          ),
        );
      });
    }

    else{
      setState(() {
        quizBrian.nextQuestion();
        scoreKeeper.add(
          Icon(

            Icons.close,
            color: Colors.red,
          ),
        );
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrian.getQuestionText(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),


        Expanded(
          child: TextButton(
            onPressed: () {
              checkAnswer(true);
              },

          child:Text(
              'True',
            ),

            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
          ),

        ),
        SizedBox(height: 15.0),
        Expanded(
          child: TextButton(
            onPressed: () {
              checkAnswer(false);
            },
            child: Text(
              'False',
            ),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 1, horizontal: 20)),
            ),
          ),
        ),

        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,

            children: scoreKeeper,
          ),
        ),
      ],
    );
  }
}
