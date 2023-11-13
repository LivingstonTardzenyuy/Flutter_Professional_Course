import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('This is a task,'),
      trailing:TaskCheckbox(checkboxState: isChecked,)
    );
  }
}


class TaskCheckbox extends StatelessWidget {
  final bool checkboxState;
  TaskCheckbox({required this.checkboxState});
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkboxState,
      onChanged: (newValue) {
        // setState(() {
        //   isChecked = newValue!;
        // });
      },
    );
  }
}
