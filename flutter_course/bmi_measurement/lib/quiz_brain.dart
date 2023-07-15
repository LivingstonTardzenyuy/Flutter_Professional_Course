import 'package:flutter/material.dart';
import 'questions.dart';

class QrizBrain{
  int _questionNumber = 0;

  List<Questions> _q = [
    Questions(question: 'Bamenda is the Capital of Nord region',questionAnswer:false),
    Questions(question: 'Programming is the ark of creating things', questionAnswer: true),
    Questions(question: 'Flutter is powered by Dart', questionAnswer: true),

  ];

  String getQuestionText() => _q[_questionNumber].question;


  bool getQuestionAnswer() => _q[_questionNumber].questionAnswer;

  void nextQuestion() {
    if (_questionNumber < _q.length -1){
      _questionNumber ++;
      print(_questionNumber);
      print(_q.length);
    }
    else if(_questionNumber == _q.length -1){
      _questionNumber = 0;
    }
  }
}