

class Question {
  late String questionText;
  late bool questionAnswer;

  Question({required String q, required bool a}) {
    questionText = q;
    questionAnswer = a;
  }
}


// TODO: implimented classes, objects, constructor,
// TODO: soo the powerful of OOOP(Abstraction, polymophism, inheritance, Encapsulation)
// TODO: Abstraction: i did seperate my code into d/f dart files where i have quiz_brain to store questions, question file which contains a class of all the questions and answers.
// TODO: Encapsulation: by making sure that each file is independent of the other. the main.dart should not have to modif the answers of each question by using access modifies e.g private, protected, publuch etc
