import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';
import '../models/tasks.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';
    return Container(
      color: Color(0xFF757575),
      height: 400,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          )
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Text('Add Task',textAlign: TextAlign.center, style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w600,fontSize: 30),),
              ),
              TextField(
                textAlign: TextAlign.center,
                autofocus: true,
                onChanged: (newTask) => newTaskTitle = newTask,
              ),

              SizedBox(height: 15,),
              Container(

                color: Colors.lightBlueAccent,
                child: TextButton(
                  onPressed: () {
                    Provider.of<TaskData>(context, listen: false).AddATask(newTaskTitle);
                    Navigator.pop(context);
                    },
                  child: Text('Add', style: TextStyle(color: Colors.white, fontSize: 20),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
