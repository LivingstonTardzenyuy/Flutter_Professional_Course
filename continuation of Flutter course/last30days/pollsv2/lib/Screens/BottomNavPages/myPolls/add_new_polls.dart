import 'package:flutter/material.dart';

class AddPollPage extends StatefulWidget {
  const AddPollPage({super.key});

  @override
  State<AddPollPage> createState() => _AddPollPageState();
}

class _AddPollPageState extends State<AddPollPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new Pole'),
      ),

      body: Center(
        child: Text('add pole'),
      ),
    );
  }
}
