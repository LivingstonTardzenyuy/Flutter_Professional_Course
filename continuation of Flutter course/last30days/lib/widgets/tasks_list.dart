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
              final task = taskData.tasks[index];
              return TaskTile(
                title: task.name,
                isChecked: task.isDone,
                checkBoxCallBack: (bool? checkboxState) {
                    taskData.updateTask(task);
                },

                longPressCallback: () {
                  taskData.deleteTask(task);
                },
              );
            }
        );
      }
    );
  }
}
