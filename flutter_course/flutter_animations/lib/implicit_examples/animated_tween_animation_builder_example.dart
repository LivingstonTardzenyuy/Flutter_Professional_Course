import 'package:flutter/material.dart';

class PulSatingCircleAnimation extends StatelessWidget {

  double size = 0;

  @override
  void initState() {
    // TODO: implement initState
    size = 200;
  }

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pulsating Circle Animation'),
      ),

      body: Center(
        child: Container(
          width: 300,
          height: 300,

          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.6),
                blurRadius: size
                // spreadRadius: size / 2
              )
            ]
          ),
        ),
      ),
    );
  }
}
