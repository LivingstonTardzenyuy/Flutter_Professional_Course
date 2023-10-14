import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedColorPalette extends StatefulWidget {


  @override
  State<AnimatedColorPalette> createState() => _AnimatedColorPaletteState();
}


class _AnimatedColorPaletteState extends State<AnimatedColorPalette> {

  List<Color> currentPalette = generateRandomPalette();

  static List<Color> generateRandomPalette() {
    final random = Random();
    return List.generate(
        4,
            (_) => Color.fromRGBO(
            random.nextInt(256),
            random.nextInt(256),
            random.nextInt(256),
            1
        ));
  }


  void regeneratePalette() {
    setState(() {
      currentPalette = generateRandomPalette();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Color Pallete'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (Color color in currentPalette)
                AnimatedContainer(
                  duration: Duration(milliseconds: 1000),

                  width: 100,
                  height: 90,
                  color: color,
                ),

            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: regeneratePalette,
                child: const Text('Generate new Pallet'))
          ],
        ),
      ),
    );
  }
}
