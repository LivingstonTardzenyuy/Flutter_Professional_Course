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
              // String provide = Provider.of<TaskData>(context);
              return TaskTile(
                  taskTitle: taskData.task[index].name,
                  isChecked: taskData.task[index].isDone,
                  checkBoxCallBack: (checkboxState) {
                    // setState(() {
                    //   Provider.of<TaskData>(context).task[index].toggleIsDone();
                    // });
                  }
              );
            }
        );
      },

    );
  }
}
