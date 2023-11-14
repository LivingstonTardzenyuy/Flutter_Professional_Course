import 'package:flutter/material.dart';

import '../models/task_data.dart';
import '../models/tasks.dart';
import '../widgets/tasts_list.dart';
import 'add_tasks_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

String getCurrentDate() {
  DateTime datetime = DateTime.now();
  var formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(datetime);
}
class TasksScreen extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        shape: CircleBorder(),
        onPressed: () => showModalBottomSheet(context: context, builder: (context) => AddTaskScreen(
            (newTasktitle){

        })),
        child: Icon(Icons.add, color: Colors.blueAccent,),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Todo', style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700, color: Colors.white),),
                    SizedBox(width: 140,),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.list, color: Colors.lightBlueAccent,),
                    ),
                  ],
                ),

                SizedBox(height: 20,),

                Row(
                  children: [
                    Text('${Provider.of<TaskData>(context).taskCount} Tasks', style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w800, fontSize: 22),),
                    SizedBox(width: 120,),
                    Text(getCurrentDate(), style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w800, fontSize: 22)),
                  ],
                ),

              ],
            ),

          ),

          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  )

              ),
              child: TaskList(),
            ),

          )

        ]

      ),
    );
  }
}

