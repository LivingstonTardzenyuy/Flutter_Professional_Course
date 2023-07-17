//
import 'dart:io';
//
// void main(){
//   begin();
// }
//
// void begin() async {
//   start1();
//   String task2result =await start2();
//   start3(task2result);
// }
//
// void start1() {
//   String result = 'Task one is done';
//   print(result);
// }
//
// Future start2() async{
//   String result = '';
//   Duration threeSeconds = Duration(seconds: 10);
//
//
//   Future.delayed(threeSeconds, (){
//     String result = 'Task two is done';
//     print(result);
//   });
//   return result;
// }
//
//
// void start3(String task2Data){
//   String result = 'Task Three is done  $task2Data';
//   print(result);
// }


void main() {
  String myString = 'abx';

  try{

    double myStringToDouble = double.parse(myString);
    print(myStringToDouble);
  }

  catch (e){
    print(e);
  }
}