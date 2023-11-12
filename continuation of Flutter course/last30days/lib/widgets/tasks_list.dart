import 'package:flutter/material.dart';
import 'package:todoss/widgets/tasktile.dart';

import '../models/task.dart';

class TaskList extends StatefulWidget {

  late List<Task> tasks;
  TaskList({required this.tasks});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(
            title: widget.tasks[index].name,
            isChecked: widget.tasks[index].isDone,
            checkBoxCallBack: (bool? checkboxState) {
              setState(() {
                widget.tasks[index].toggleDone();
              });
            },
          );
        }
    );
    // },

  }
}
