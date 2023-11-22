import 'package:flutter/material.dart';

class MyPoles extends StatefulWidget {
  const MyPoles({super.key});

  @override
  State<MyPoles> createState() => _MyPolesState();
}

class _MyPolesState extends State<MyPoles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text('Polls page'))
    );
  }
}
