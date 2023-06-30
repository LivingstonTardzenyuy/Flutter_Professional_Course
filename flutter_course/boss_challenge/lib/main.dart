import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          title: Text('Ask me Anything'),
          centerTitle: true,
        ),

        body: Play(),
      ),
    ),

  );
}

class Play extends StatefulWidget {
  const Play({super.key});

  @override
  State<Play> createState() => _PlayState();
}

int ballDefault = 1;




class _PlayState extends State<Play> {
  @override
  Widget build(BuildContext context) {

    void changeball() {
      setState(() {
        ballDefault = Random().nextInt(5) +1;
      });
    }

      return Center(


      child: TextButton(
        onPressed: () {
          changeball();
        },
        child: Image(
          image: AssetImage('images/ball$ballDefault.png'),

        ),
      ),
    );
  }
}
