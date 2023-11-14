import 'package:flutter/material.dart';
import 'tasks.dart';

class TaskData extends ChangeNotifier{
  List<Task> task = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy Bread'),
    Task(name: 'Buy Coffee'),
  ];

  int get taskCount {
    return task.length;
  }


  void AddATask(String newTaskTitle){
  final tas = Task(name: newTaskTitle);
  task.add(tas);
  notifyListeners();
  }
}