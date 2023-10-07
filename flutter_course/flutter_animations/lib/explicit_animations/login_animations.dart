import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin{

  late Animation<double> opacityAnimation;
  late AnimationController controller;
  late Animation<Offset> slideAnimation;


  @override
  void initState() {
    super.initState();

    controller = AnimationController(
                                    vsync: this,
                                    duration: const Duration(milliseconds: 3500)
    );
    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(controller);

    slideAnimation = Tween(begin: Offset(-1, -1), end: Offset.zero).animate(CurvedAnimation(parent: controller, curve: Curves.ease));

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
                child: const FlutterLogo(size: 100,)),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SlideTransition(
                  position: slideAnimation,
                  child: Column(
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Username'
                        ),
                      ),

                      const SizedBox(height: 20,),

                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Password'
                        ),
                      ),

                      SizedBox(height: 30,),
                      Container(
                        width: 70,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.purple
                        ),
                        child: Center(child: Text('Login')),
                      )
                    ],
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
