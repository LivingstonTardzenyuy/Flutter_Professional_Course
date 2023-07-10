import 'package:flutter/material.dart';
import 'input_page.dart';
import 'constants.dart';


class ReusableCard extends StatelessWidget {

  ReusableCard({required this.colour, this.cardChild});

  final Color colour;
  final Widget? cardChild;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: cardChild,
        margin: kmarginContainer,
        decoration: BoxDecoration(
          color: Color(0xFF0A0E21),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}




