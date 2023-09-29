import 'package:flutter/material.dart';

import '../utils/dimensions.dart';


class ResponsiveLayout extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;

  const ResponsiveLayout({required this.mobileScreenLayout, required this.webScreenLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constrains){
          if(constrains.maxWidth > webScreenSize){
            // web screen
            return webScreenLayout;
          }

          else{
            //mobile screen
            return mobileScreenLayout;
          }
        });
  }
}
