import 'package:flutter/material.dart';

class LoginScreenAnimation extends StatefulWidget {
  const LoginScreenAnimation({super.key});

  @override
  State<LoginScreenAnimation> createState() => _LoginScreenAnimationState();
}

class _LoginScreenAnimationState extends State<LoginScreenAnimation> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> opacityAnimation;

  late Animation<Offset> slideAnimation;
  late Animation<double> scaleAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1500));
    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(controller);


    slideAnimation = Tween(begin: Offset(-1, -1), end: Offset(0, 0)).animate(CurvedAnimation(parent: controller, curve: Curves.ease));

    scaleAnimation = Tween<double>(begin: 0, end: 1).animate(controller);
    controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: opacityAnimation,
              child: const FlutterLogo(
                size: 100.0,
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SlideTransition(
                  position: slideAnimation,
                  child: ScaleTransition(
                    scale: scaleAnimation,
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
                            labelText: 'Password',
                          ),
                        ),

                        SizedBox(height: 25,),
                        Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueGrey,

                          ),
                          child: TextButton(
                              onPressed: () {},
                              child: Text('click'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}
