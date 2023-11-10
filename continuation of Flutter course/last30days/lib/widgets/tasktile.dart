import 'package:flutter/material.dart';
import 'package:todoss/widgets/task_check_box.dart';

class TaskTile extends StatelessWidget {
 final bool isChecked;
 final String title;
 TaskTile({required this.title,required this.isChecked});


  // void toggleCheckedState(bool? checkboxState) {
  //   setState(() {
  //     isChecked = checkboxState ?? false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'This is a task',
        style: TextStyle(decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        // activeColor: Colors.lightBlueAccent,
        value: isChecked,
        // onChanged: checkboxCallback,
      );
    );
  }
}

//
// (bool? checkboxState) {
// setState(() {
// isChecked = checkboxState ?? false;
// });
// },