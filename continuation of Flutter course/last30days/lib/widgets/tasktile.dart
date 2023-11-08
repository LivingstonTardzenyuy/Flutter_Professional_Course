import 'package:flutter/material.dart';


class TaskTile extends StatefulWidget {
  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  // const TaskList({super.key});
  @override
  bool isChecked = true;

  Widget build(BuildContext context) {
    return ListTile(
      title: Text('This is a task'),
      trailing:

    );

  }
}
