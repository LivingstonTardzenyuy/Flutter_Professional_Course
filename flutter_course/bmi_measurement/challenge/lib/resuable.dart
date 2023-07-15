import 'package:flutter/material.dart';


class ResusableCard extends StatelessWidget {
  final Color colour;
  final Widget? cardChild;

  ResusableCard({required this.colour, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}