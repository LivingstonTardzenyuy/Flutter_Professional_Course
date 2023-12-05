import 'package:flutter/material.dart';



class RoundedButton extends StatelessWidget {
  late Color color;
  late String label;
  late VoidCallback onTap;

  RoundedButton({
    required this.color,
    required this.label,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onTap,
          minWidth: 200.0,
          height: 42.0,
          child: Text(

            label,
          ),
        ),
      ),
    );
  }
}
