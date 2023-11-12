import 'package:flutter/material.dart';
import 'package:todoss/screens/tasks_screens.dart';
import 'package:provider/provider.dart';

import 'models/tasks_data.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}
