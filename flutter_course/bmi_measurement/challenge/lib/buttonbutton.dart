import 'package:flutter/material.dart';
import 'constant.dart';


class ButtonButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonTitle;

  ButtonButton({required this.onTap,required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // Navigator.push(context, MaterialPageRoute(builder: (context){
      //   return MyApp();
      // },),);
      // Navigator.pushNamed(context, '/results');

      child: Container(
        color: kButtonContainerColour,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kButtonContainerHeight,
        child: Center(
          child: Text(
            buttonTitle,
            textAlign: TextAlign.center,
            style: klabelTextStyle,
          ),
        ),
      ),
    );
  }
}
