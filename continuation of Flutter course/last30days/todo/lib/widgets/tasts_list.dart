import 'package:flutter/material.dart';
import 'package:todo/widgets/tast_tile.dart';

import 'package:provider/provider.dart';
import '../models/task_data.dart';

class TaskList extends StatelessWidget {

  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext, taskData, child){
        return ListView.builder(
            itemCount: taskData.taskCount,
            itemBuilder: (context, index){
                  final task = taskData.task[index];
                  return TaskTile(
                  taskTitle: task.name,
                  isChecked: task.isDone,
                  checkBoxCallBack: (checkboxState) => taskData.updateTask(task)
              );
            }
        );
      },

    );
  }
}
