import 'package:flutter/material.dart';

import '../models/task.dart';
import '../widgets/add_task_screen.dart';
import '../widgets/tasks_list.dart';
import '../widgets/tasktile.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});


  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {

  List<Task> tasks = [];

  @override

  Widget build(BuildContext context) {



    bool isChecked = false;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        shape: CircleBorder(),
        onPressed: () {
          showModalBottomSheet(context: context, builder: (context) =>
              AddTaskScreen((newTaskTitle){
                setState(() {
                  tasks.add(Task(name: newTaskTitle));
                });
                Navigator.pop(context);
          },));
        },
        child: Icon(Icons.add,),
      ),

      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                        radius: 30,
                          backgroundColor: Colors.white,
                        child: Icon(Icons.list, color: Colors.lightBlueAccent, size: 30.0,)),

                    Text('Todo App', style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                    ),),
                  ],
                ),

                const SizedBox(height: 20,),
                Row(
                  children: [
                    Text('${tasks.length}', style: TextStyle(color: Colors.black, fontSize: 20),),
                    SizedBox(width: 10,),
                    Text('Tasks', style: TextStyle(color: Colors.white, fontSize: 20),),
                  ],
                ),
                const SizedBox(width: 12,),


              ],
            ),
          ),

          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))

              ),
              child: TaskList(tasks: tasks,),
            ),
          ),
        ],
      ),


    );
  }
}
