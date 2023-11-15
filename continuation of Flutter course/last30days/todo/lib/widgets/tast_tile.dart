import 'package:flutter/material.dart';

import '../models/task_data.dart';
import 'package:provider/provider.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkBoxCallBack;
  final Function() longPressCalback;
  TaskTile({this.isChecked= true, required this.taskTitle, required this.checkBoxCallBack, required this.longPressCalback});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCalback,
      title: Text(taskTitle, style: TextStyle(decoration:isChecked? TextDecoration.lineThrough : null, color: isChecked ? Colors.red: Colors.blue),),
      trailing:Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkBoxCallBack,

      ),

    );
  }
}

