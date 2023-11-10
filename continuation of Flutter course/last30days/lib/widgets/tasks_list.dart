import 'package:flutter/material.dart';
import 'package:todoss/widgets/tasktile.dart';

import '../models/task.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {

  List<Task> taks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy Bread'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        
        TaskTile(),
        TaskTile(),
        TaskTile(),

      ],
    );
  }
}
