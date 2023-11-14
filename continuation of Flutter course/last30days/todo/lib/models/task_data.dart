import 'dart:collection';

import 'package:flutter/material.dart';
import 'tasks.dart';

class TaskData extends ChangeNotifier{
  List<Task> _task = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy Bread'),
    Task(name: 'Buy Coffee'),
  ];

  UnmodifiableListView<Task> get task{
    return UnmodifiableListView(_task);
  }
  int get taskCount {
    return _task.length;
  }


  void AddATask(String newTaskTitle){
  final tas = Task(name: newTaskTitle);
  _task.add(tas);
  notifyListeners();
  }
}