import 'package:flutter/material.dart';
import 'package:todo/widgets/tast_tile.dart';

import '../models/tasks.dart';

class TaskList extends StatefulWidget {
  List<Task> tasks;
  TaskList({required this.tasks});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {


  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
        itemBuilder: (context, index){

          return TaskTile(
              taskTitle: widget.tasks[index].name,
                isChecked: widget.tasks[index].isDone,
              checkBoxCallBack: (checkboxState) {
                setState(() {
                  widget.tasks[index].toggleIsDone();
                });
              }
            );
        }
    );
  }
}
