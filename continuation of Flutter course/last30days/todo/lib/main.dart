import 'package:flutter/material.dart';
import 'package:todo/screens/task_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: TasksScreen(),
//     );
//   }
// }


class MyApp extends StatelessWidget {
  final String data = 'Top Secret Data';
  @override
  Widget build(BuildContext context) {
    return Provider<String>(
      create: (context)  => data,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Container(
              child: Center(child: Text(data, style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.w800),)),
            ),
          ),
          body: Level1(data),
        ),
      ),
    );
  }
}


class Level1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
          child: Level2(data),
    );
  }
}


class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Level3(data),
          Container(),
        ],
      );
  }
}


class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(data);
  }
}
