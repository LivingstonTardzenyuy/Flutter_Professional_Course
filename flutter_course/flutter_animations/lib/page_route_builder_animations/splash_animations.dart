import 'dart:async';

import 'package:flutter/material.dart';


class SplashAnimation extends StatefulWidget {
  const SplashAnimation({super.key});

  @override
  State<SplashAnimation> createState() => _SplashAnimationState();
}

class _SplashAnimationState extends State<SplashAnimation> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> scaleAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration:const Duration(milliseconds: 500));


    controller.addListener(() {
      if(controller.isCompleted){
        Navigator.of(context).push(
          PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
            return const Destination();
          },

            transitionsBuilder: (context, animation, secondaryAnimation, child){
            // return FadeTransition(opacity: animation, child: child,);
              final tween = Tween(begin: Offset(0, -1), end: Offset.zero).animate(animation);
              return SlideTransition(
                  position: tween,
                  child: child,
              );
            }
          )
        );



        Timer(const Duration(milliseconds: 500), () {
          controller.reset();
        });
      }


    });

    scaleAnimation = Tween<double>(begin: 1, end: 10).animate(controller);
    // slideAnimation = Tween<double>(begin: )
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //       builder: (context) => const Destination())
            // );
            controller.forward();
          },
            child: ScaleTransition(
              scale: scaleAnimation,
              child: Container(
                width: 100,
                height: 100,

                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue
                ),
              ),
            ),
        ),
      ),
    );
  }
}


class Destination extends StatefulWidget {
  const Destination({super.key});

  @override
  State<Destination> createState() => _DestinationState();
}

class _DestinationState extends State<Destination> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Go Back'),
      ),

      body: Center(
        child: Text('Hello world'),
      ),
    );
  }
}
