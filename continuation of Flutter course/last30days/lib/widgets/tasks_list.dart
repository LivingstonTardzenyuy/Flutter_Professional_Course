import 'package:flutter/material.dart';
import 'package:todoss/widgets/tasktile.dart';

import 'package:provider/provider.dart';

import '../models/tasks_data.dart';

class TaskList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child){
        return ListView.builder(
            itemCount: taskData.taskCount,
            itemBuilder: (context, index) {
              return TaskTile(
                title: taskData.tasks[index].name,
                isChecked: taskData.tasks[index].isDone,
                checkBoxCallBack: (bool? checkboxState) {
                  // setState(() {
                  //   Provider.of<TaskData>(context).tasks[index].toggleDone();
                  // });
                },
              );
            }
        );
      }
    );
  }
}
