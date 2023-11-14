import 'package:flutter/material.dart';

import '../models/tasks.dart';
import '../widgets/tasts_list.dart';
import 'add_tasks_screen.dart';
import 'package:intl/intl.dart';

String getCurrentDate() {
  DateTime datetime = DateTime.now();
  var formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(datetime);
}
class TasksScreen extends StatefulWidget {

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> task = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy Bread'),
    Task(name: 'Buy Coffee'),
  ];

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        shape: CircleBorder(),
        onPressed: () => showModalBottomSheet(context: context, builder: (context) => AddTaskScreen((newTaskTitle){
          setState(() {
            task.add(Task(name: newTaskTitle));
          });
        })),
        child: Icon(Icons.add),
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
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.list, color: Colors.lightBlueAccent,),
                    ),
                    SizedBox(width: 140,),
                    Text('Todo', style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700, color: Colors.white),),
                  ],
                ),

                SizedBox(height: 20,),

                Row(
                  children: [
                    Text('${task.length} Tasks', style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w800, fontSize: 22),),
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
              child: TaskList(tasks: task),
            ),

          )

        ]

      ),
    );
  }
}

