import 'package:flutter/material.dart';

class Explore extends StatelessWidget {

  Explore({required this.icon, required this.label});
  late IconData icon;
  late String label;

  @override
  Widget build(BuildContext context) {
    return Column(
          children: <Widget>[
            Icon(icon),
            SizedBox(height: 10,),
            Text(label),

          ],
    );
  }
}
