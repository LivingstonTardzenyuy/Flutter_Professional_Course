import 'package:flutter/material.dart';

import 'explicit_animations/listAnimation.dart';
import 'explicit_animations/login_animations.dart';
import 'implicit_examples/animated_color_pallete.dart';
import 'implicit_examples/animated_shopping_cart_button.dart';
import 'implicit_examples/animated_tween_animation_builder_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ListAnimation(),
    );
  }
}