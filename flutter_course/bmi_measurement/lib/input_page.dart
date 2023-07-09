import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusableCard.dart';
import 'icons.dart';

class InputPage extends StatefulWidget {

  @override
  State<InputPage> createState() => _InputPageState();
}

const colorTheme = Color(0xFF0A0E28);
const marginContainer = EdgeInsets.all(15.0);
const inactiveCardColour = Color(0xFF111328);

class _InputPageState extends State<InputPage> {

  Color maleCardColour = inactiveCardColour;
  Color femaleCardColour = inactiveCardColour;

  // 1 = male , 2 = female
  void updateColour(int press){
    if (maleCardColour == 1){
      if (maleCardColour == inactiveCardColour){
        maleCardColour = colorTheme;
        femaleCardColour = inactiveCardColour;
      }
    }

    if (femaleCardColour == 2){
      if (femaleCardColour == 2){
        if(femaleCardColour == inactiveCardColour){
          femaleCardColour = colorTheme;
          maleCardColour = inactiveCardColour;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: Color(0xFF0A0E28),
      ),

      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(child: GestureDetector(
                  onTap: () {

                    setState(() {
                      updateColour(1);
                    });

                  },

                  child: ReusableCard(colour: maleCardColour,
                    cardChild: ReusableStyle(
                      icon: FontAwesomeIcons.mars, label: 'MALE',
                    ),
                  ),
                ),
                ),



                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(2);
                      });
                    },
                    child: GestureDetector(
                      onTap: () {

                      },


                      child: ReusableCard(colour: femaleCardColour,
                      cardChild: ReusableStyle(icon: FontAwesomeIcons.venus, label: 'FEMALE')
                        ),
                    ),
                  ),
                ),

              ],

            ),
          ),

          Expanded(
            child: ReusableCard(colour: colorTheme,
            ),
          ),


          Expanded(
            child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(colour: colorTheme,),
              ),

              Expanded(
                child: ReusableCard(colour: colorTheme,),
              ),
            ],
            ),
          )
        ],

      ),
    );

  }
}
