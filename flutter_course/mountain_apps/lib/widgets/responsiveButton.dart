import 'package:flutter/material.dart';

import '../appResources/appcolors.dart';

class ResponsiveButton extends StatelessWidget {
  late bool isResponsive;
  late double? width;
  late String text;

  ResponsiveButton({this.isResponsive = false, this.width, this.text = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12),
      width: width,
      height: 45,
      child: Center(
          child: Text(
              text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
      ),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor
      ),
    );
  }
}
