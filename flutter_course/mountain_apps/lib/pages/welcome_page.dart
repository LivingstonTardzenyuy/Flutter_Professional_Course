import 'package:flutter/material.dart';

import '../widgets/app_large_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  List images = [
    "welcome-one.jpg",
    "welcome-two.jpeg",
    "welcome-three.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_, index){
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/"+images[index]),
                fit: BoxFit.cover
              ),
            ),

            child: Container(
              margin: const EdgeInsets.only(top: 120, left: 20, right:20),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      AppLargeText(text: "Trips", colour: Colors.black, size: 25),
                    ],
                  )
                ],
              ),
            ),
          );
      },)
    );
  }
}
