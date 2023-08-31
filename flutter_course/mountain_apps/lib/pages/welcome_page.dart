import 'package:flutter/material.dart';

import '../appResources/appcolors.dart';
import '../appResources/strings.dart';
import '../widgets/app_large_text.dart';
import '../widgets/responsiveButton.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  List images = [
    "welcome-two.jpg",
    "welcome-one.jpg",
    "welcome-two.jpg",

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_, index){
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/"+images[index]),
                fit: BoxFit.cover
              ),
            ),

            child: Container(
              margin: const EdgeInsets.only(top: 120,left: 20, right:20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        // margin: EdgeInsets.only(left: 0.0),
                          child: AppLargeText(text: AppStrings.discover, colour: Colors.black, size: 30, isBold: true,),
                      ),

                      SizedBox(height: 20,),
                      Container(
                        width: 250,
                        child: AppLargeText(text: AppStrings.textMountain, colour: Colors.black, size: 15, isBold: false,),
                      ),

                      SizedBox(height: 40,),

                      ResponsiveButton(width: 120, text: AppStrings.proceed,),
                    ],
                  ),

                  Column(
                    children: List.generate(3, (indexDots){
                      return Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        width: 8,
                        height: index == indexDots ? 25 : 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index == indexDots? AppColors.mainColor : AppColors.mainColor.withOpacity(0.3)
                        ),
                      );
                    })
                  )
                ],
              ),
            ),
          );
      },)
    );
  }
}
