import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TestPage extends StatefulWidget {
  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int count = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(
          'This is coutner $count',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      )),

      floatingActionButton: FloatingActionButton(
          onPressed: () {

            setState(() {
              count++;
              print(count);
            });
          },
        child: Icon(Icons.add),
      ),
    );
  }
}
