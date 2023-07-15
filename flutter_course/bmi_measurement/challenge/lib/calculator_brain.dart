
import 'dart:math';

class CalculatorBrain{


  CalculatorBrain({required this.height,required this.weight});

  final int height;
  final int weight;
  late double _bmi;

  String calculateBMi(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults(){
    if (_bmi >= 25){
      return 'OverWeight';
    }

    else if (_bmi > 18.5){
      return 'Normal';
    }
    else{
      return 'UnderWeight';
    }
  }

  String getInterpretation(){
    if (_bmi >=25){
      return 'You have a higher than normal body weight. Try to exercise more.';
    }
    else if (_bmi >= 18.5){
      return 'You have a normal weight. Keep up';
    }
    else{
      return 'You have a lower weight. Please try to eat more';
    }
  }
}