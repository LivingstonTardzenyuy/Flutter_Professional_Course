import 'package:flutter/material.dart';

class TaksCheckBox extends StatelessWidget {

  final bool isChecked;
  final void Function(bool?) checkboxCallback;
  TaksCheckBox({required this.checkboxCallback, required this.isChecked});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      // activeColor: Colors.lightBlueAccent,
      value: isChecked,
      onChanged: checkboxCallback,
    );
  }
}
