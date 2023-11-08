import 'package:flutter/material.dart';

class TaksCheckBox extends StatelessWidget {
  const TaksCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: true,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
