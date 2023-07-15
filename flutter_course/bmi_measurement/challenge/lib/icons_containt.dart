import 'package:flutter/material.dart';
import 'resuable.dart';
import 'constant.dart';


class IconAndGender extends StatelessWidget {

  IconAndGender({required this.klabel,required this.kIcon});

  late String klabel;
  late IconData kIcon;
  @override
  Widget build(BuildContext context) {
    return ResusableCard(
      colour: kActiveCardColour,
      cardChild: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(
                kIcon,
                size: 70.0,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              klabel,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
