import 'question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';


class QuizzBrain {
  int _question_number = 0;

  List<Question> _questionBank = [
    Question(q: 'You can lead a cow down stairs but not up stairs', a: false),
    Question(q: 'Cameroon is the found in Central Africa', a: true),
    Question(q: 'The University of Bamenda is found in Bambili', a: true),
    Question(q: 'Html is a programming language', a: false),
    Question(q: 'The World is round', a: true),
    Question(q: 'Computers are not mean to make our work easy', a: false),
    Question(
        q: 'Approximately one quarter of humans bons are in the feet', a: true),
    Question(q: 'A slug\'s blood is greeen', a: true),

  ];

  void nextQuestion() {
    if (_question_number < _questionBank.length - 1) {
      _question_number ++;
    }

    print(_question_number);
    print(_questionBank.length);
  }

  String getQuestionText() {
    return _questionBank[_question_number].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_question_number].questionAnswer;
  }


  bool isFinished() {
    if (_question_number >= _questionBank.length - 1) {
      print('Now returning true');
      return true;
    }

    else {
      return false;
    }
  }

  void rest(){
    _question_number = 0;
  }
}