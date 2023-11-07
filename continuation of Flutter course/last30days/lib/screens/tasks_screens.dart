import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        shape: CircleBorder(),
        onPressed: () {},
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
                CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.list, color: Colors.lightBlueAccent, size: 30.0,)),

                const SizedBox(height: 20,),
                Text('Todo', style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  fontWeight: FontWeight.w700,
                ),),

                Row(
                  children: [
                    Text('12', style: TextStyle(color: Colors.white, fontSize: 20),),
                    const SizedBox(width: 12,),
                    Text('Tasks', style: TextStyle(color: Colors.white, fontSize: 20),)
                  ],
                ),


              ],
            ),
          ),

          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))

              ),
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Thi'),
                  )
                ],
              )
            ),
          ),
        ],
      ),


    );
  }
}
