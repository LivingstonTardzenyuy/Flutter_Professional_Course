import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),

        )
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Text('Add Task', textAlign: TextAlign.center, style: TextStyle(color: Colors.lightBlueAccent, fontSize: 25, fontWeight: FontWeight.w500),),

            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20,),
            Container(
              color: Colors.blue,
              child: TextButton(
                onPressed: () {
                  print('you press to add something');
                },
                child: Text('Add', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
