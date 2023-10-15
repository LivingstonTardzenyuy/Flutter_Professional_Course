import 'package:flutter/material.dart';


class PulsatingCircleAnimation extends StatefulWidget {
  const PulsatingCircleAnimation({super.key});

  @override
  State<PulsatingCircleAnimation> createState() => _PulsatingCircleAnimationState();
}

class _PulsatingCircleAnimationState extends State<PulsatingCircleAnimation> {
  double size = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      size = 200;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          duration: Duration(milliseconds: 3500),
          tween: Tween<double>(begin: 0, end: 200),
          builder: (context, object, widget){
            return Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      blurRadius: size,
                      spreadRadius: size / 2,
                    )
                  ]
              ),
                child: widget
            );
          },

          child: const Text('Today is a good day!'),
        ),
      ),
    );
  }
}
