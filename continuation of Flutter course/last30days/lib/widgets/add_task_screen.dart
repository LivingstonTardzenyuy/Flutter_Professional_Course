import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class AddTaskScreen extends StatelessWidget {

  final Function addTaskCallBack;
  AddTaskScreen(@required this.addTaskCallBack);
  @override
  Widget build(BuildContext context) {

    String newTaskTitle ='';
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
              onChanged: (newText){
                newTaskTitle = newText;
              },
            ),
            const SizedBox(height: 20,),
            Container(
              color: Colors.blue,
              child: TextButton(
                onPressed: () {
                  addTaskCallBack(newTaskTitle);
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


class Data extends ChangeNotifier {
  String data = '';

  void changeString(String newString){
    data = newString;

    notifyListeners();
  }
}


