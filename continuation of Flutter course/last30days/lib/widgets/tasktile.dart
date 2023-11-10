import 'package:flutter/material.dart';
import 'package:todoss/widgets/task_check_box.dart';

class TaskTile extends StatefulWidget {
  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  void toggleCheckedState(bool? checkboxState) {
    setState(() {
      isChecked = checkboxState ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'This is a task',
        style: TextStyle(decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: TaksCheckBox(
        isChecked: isChecked,
        checkboxCallback: (bool? checkboxState) {
          setState(() {
            isChecked = checkboxState ?? false;
          });
        },
      ),
    );
  }
}