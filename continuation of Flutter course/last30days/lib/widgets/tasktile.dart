import 'package:flutter/material.dart';
import 'package:todoss/widgets/task_check_box.dart';

class TaskTile extends StatefulWidget {
 // final
 // final String title;
 // TaskTile({required this.title,required this.isChecked});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

bool isChecked= false;
class _TaskTileState extends State<TaskTile> {
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
      trailing: TaksCheckBox(checkboxCallback: toggleCheckedState,isChecked: isChecked,)
    );
  }
}

//
// (bool? checkboxState) {
// setState(() {
// isChecked = checkboxState ?? false;
// });
// },