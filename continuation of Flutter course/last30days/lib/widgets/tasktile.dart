import 'package:flutter/material.dart';
import 'package:todoss/widgets/task_check_box.dart';

class TaskTile extends StatefulWidget {
  final String title;
  final bool isChecked;
  final Function(bool?) checkBoxCallBack;

  TaskTile({required this.title,required this.isChecked, required this.checkBoxCallBack});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override

  Widget build(BuildContext context) {
    bool checked = widget.isChecked;
    return ListTile(
      title: Text(
        widget.title,
        style: TextStyle( fontSize: 17, decoration: widget.isChecked ? TextDecoration.lineThrough : null, color: widget.isChecked ? Colors.black : Colors.purpleAccent),
      ),

        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: widget.isChecked,
          onChanged: widget.checkBoxCallBack,
        )

      );
  }
}


// setState(() {
// isChecked = checkboxState ?? false;
// });

//
// (bool? checkboxState) {
// setState(() {
// isChecked = checkboxState ?? false;
// });
// },