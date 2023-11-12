import 'package:flutter/material.dart';
import 'package:todoss/widgets/tasktile.dart';

import 'package:provider/provider.dart';

import '../models/tasks_data.dart';

class TaskList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Provider.of<TaskData>(context).tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(
            title: Provider.of<TaskData>(context).tasks[index].name,
            isChecked: Provider.of<TaskData>(context).tasks[index].isDone,
            checkBoxCallBack: (bool? checkboxState) {
              // setState(() {
              //   Provider.of<TaskData>(context).tasks[index].toggleDone();
              // });
            },
          );
        }
    );
    // },

  }
}
