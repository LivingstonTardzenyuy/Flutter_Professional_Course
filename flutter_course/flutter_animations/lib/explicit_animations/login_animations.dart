import 'package:flutter/material.dart';


class LoginScreenAnimation extends StatefulWidget {
  const LoginScreenAnimation({super.key});

  @override
  State<LoginScreenAnimation> createState() => _LoginScreenAnimationState();
}

class _LoginScreenAnimationState extends State<LoginScreenAnimation> with SingleTickerProviderStateMixin {

  late Animation<double> opacity;
  late AnimationController animationController;
  late Animation<Offset> slideAnimation;

  late Animation<double> scaleAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    opacity = Tween<double>(begin: 0, end: 1).animate(animationController);

    animationController.addListener(() {
      if(animationController.isCompleted){
        animationController.reverse();
      }
    });

    slideAnimation = Tween(begin: Offset(-1, -1), end: Offset.zero).animate(CurvedAnimation(parent: animationController, curve: Curves.ease));
    animationController.forward();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
                opacity: opacity,
                child: const FlutterLogo(size: 100,)),

            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SlideTransition(
              position: slideAnimation,

              child: Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                    ),
                  ),

                  const SizedBox(height: 16.0,),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Password'
                    ),
                  ),

                  SizedBox(height: 20.0,),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text('Submit'))
                ],
              ),
            ),
            )
          ],
        ),
      ),
    );
  }
}
