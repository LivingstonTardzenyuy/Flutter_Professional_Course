import 'package:flutter/material.dart';


class PulsatingCircleAnimation extends StatefulWidget {
  const PulsatingCircleAnimation({super.key});

  @override
  State<PulsatingCircleAnimation> createState() => _PulsatingCircleAnimationState();
}

class _PulsatingCircleAnimationState extends State<PulsatingCircleAnimation> {
  double size = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pulsating Circle animations'),
      ),

      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween(begin: 0, end: 200),
          duration: Duration(milliseconds: 500),
          builder: (context) {
            return Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.yellowAccent.withOpacity(0.5),
                      blurRadius: size,
                      spreadRadius: size/2,
                    )
                  ]
              ),
            );
          },
        ),
      ),
    );
  }
}
