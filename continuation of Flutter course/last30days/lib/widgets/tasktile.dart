import 'package:flutter/material.dart';
import 'package:todoss/widgets/task_check_box.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final bool isChecked;
  final Function(bool?) checkBoxCallBack;
  final Function() longPressCallback;

  TaskTile({required this.title,required this.isChecked, required this.checkBoxCallBack, required this.longPressCallback});
  @override

  Widget build(BuildContext context) {
    bool checked = isChecked;
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        title,
        style: TextStyle( fontSize: 17, decoration: isChecked ? TextDecoration.lineThrough : null, color: isChecked ? Colors.black : Colors.purpleAccent),
      ),

        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: checkBoxCallBack,
        )

      );
  }
}

