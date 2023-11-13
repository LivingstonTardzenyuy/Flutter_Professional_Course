import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        shape: CircleBorder(),
        onPressed: () {

        },
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
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.list, color: Colors.lightBlueAccent,),
                ),

                SizedBox(height: 10,),
                Text('Todo', style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700, color: Colors.white),),

                Text('12 Tasks', style: TextStyle(color: Colors.white, fontSize: 18),),

              ],
            ),

          ),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  )

              ),
              child: ListView(

              ),
            ),

          )

        ]

      ),
    );
  }
}
