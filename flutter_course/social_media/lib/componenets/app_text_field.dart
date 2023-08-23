import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  AppTextField({required this.hint});
  final String hint;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        labelText: hint,
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        border:const UnderlineInputBorder(

        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(12)),

    ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.7)),
    );
  }
}
