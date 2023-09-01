import 'package:flutter/material.dart';
import 'package:mountain_apps/widgets/app_large_text.dart';
import 'package:mountain_apps/widgets/responsiveButton.dart';

import '../../appResources/appcolors.dart';
import '../../widgets/app_buttons.dart';
import '../../widgets/app_text.dart';


class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottonStars = 3;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(

          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/mountains/mount4.jpeg'),
                        fit: BoxFit.cover,
                      )
                  ),
                )),

            Positioned(
                left: 20,
                top: 70,
                child: Row(
              children: <Widget>[
                IconButton(onPressed: (){}, icon: Icon(Icons.menu),
                color: Colors.white,),
                // Expanded(child: Container()),
                // IconButton(onPressed: (){}, icon: Icon(Icons.three_k_plus))
              ],
            )),

            Positioned(
                top: 330,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          AppLargeText(size: 20, text: "Bamenda", colour: Colors.grey, isBold: true),

                          AppLargeText(size: 20, text: "\$ 250", colour: Colors.black, isBold: true)
                        ],
                      ),

                      SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          Icon(Icons.location_on, color: AppColors.mainColor),
                          SizedBox(width: 10,),
                          AppText(label: "CMR,  South West", colour: AppColors.textColor1),



                        ],
                      ),

                    SizedBox(height: 20,),

                      Row(
                        children: <Widget>[
                          Wrap(

                            children: List.generate(5, (index){
                              return Icon(Icons.star,
                                  color: gottonStars >= index ? AppColors.starColor : AppColors.textColor2
                              );
                            }),
                          ),
                          SizedBox(width: 10,),
                          AppText(label: "(8.0)", colour: AppColors.textColor2,)
                        ],
                      ),

                      SizedBox(height: 15,),
                      AppLargeText(size: 25, text: "People", colour: Colors.black.withOpacity(0.8), isBold: true),
                      SizedBox(height: 5,),
                      AppText(label: "Number of People in group", colour: AppColors.mainTextColor),

                      SizedBox(height: 5,),
                      Wrap(
                        children: List.generate(5, (index){
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                                child: AppButtons(
                                    size: 50,
                                    colour: selectedIndex == index ? Colors.white :  Colors.black,
                                    backgroundColour: selectedIndex == index ? Colors.black :  AppColors.buttonBackground,
                                    borderColor: selectedIndex == index ? Colors.black : AppColors.buttonBackground,
                                    isIcon: false,
                                    text: (index + 1).toString()
                                ),

                            ),
                          );
                        }),
                      ),

                      SizedBox(height: 5,),
                      AppLargeText(size: 20, text: "Description", colour: Colors.black, isBold: true),

                      AppText(label: "Let's go for a visit. Today will be an exciting day as we will be visiting some cool mountains around us. Put on your shoes let go for a great visit", colour: AppColors.mainTextColor),

                      SizedBox(height: 25,),

                  ]
                  ),
            )),

            SizedBox(height: 15,),
            Positioned(
              bottom: 20,
              left: 20,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppButtons(
                    size: 50,
                    colour: AppColors.textColor1,
                    backgroundColour: Colors.white,
                    borderColor: AppColors.textColor1,

                    isIcon: true,
                    icon: Icons.favorite_border,
                  ),

                  // Expanded(child: Container()),
                  SizedBox(width: 20,),
                  ResponsiveButton(
                    text: "Let's Travel up mountain",
                    isResponsive: true,
                    width: 250,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
