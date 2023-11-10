import 'package:flutter/material.dart';
import 'package:todoss/widgets/tasktile.dart';

import '../models/task.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {

  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy Bread'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(
            title: tasks[index].name,
            isChecked: tasks[index].isDone,
            checkBoxCallBack: (bool? checkboxState) {
              setState(() {
                tasks[index].toggleDone();
              });
            },
          );
        }
    );
      // },

    }
}
