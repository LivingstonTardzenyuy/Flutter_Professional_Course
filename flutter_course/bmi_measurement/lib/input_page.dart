import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusableCard.dart';
import 'icons.dart';
import 'constants.dart';

class InputPage extends StatefulWidget {

  @override
  State<InputPage> createState() => _InputPageState();
}


enum GenderType{
  male,
  female,
}

int height = 180;
int weight = 50;
int age = 20;
class _InputPageState extends State<InputPage> {

  Color maleCardColour = kinactiveCardColour;
  Color femaleCardColour = kinactiveCardColour;

  // 1 = male , 2 = female
  void updateColour(GenderType selectedGender){
    if (selectedGender == GenderType.male){
      if (maleCardColour == kinactiveCardColour){
        maleCardColour = kcolorTheme;
        femaleCardColour = kinactiveCardColour;
      }
    }

      if (selectedGender == GenderType.female){
        if(femaleCardColour == kinactiveCardColour){
          femaleCardColour = kcolorTheme;
          maleCardColour = kinactiveCardColour;
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(child: GestureDetector(
                  onTap: () {

                    setState(() {
                      updateColour(GenderType.male);
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
                        updateColour(GenderType.female);
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
            child: ReusableCard(
              colour: kcolorTheme,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),

                  SizedBox(height: 20.0),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kTextStyleForMiddleCardColumn,
                      ),

                      Text(

                          'cm',
                        style: klabelTextStyle,
                      )
                    ],
                  ),


                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0xFFEB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Colors.white,
                      inactiveColor: Color(0xFF8D8E98),

                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },

                    ),
                  ),
                ],
              ),
            ),
          ),


          Expanded(
            child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: kcolorTheme,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                      'WEIGHT',
                      // style: TextStyle(
                      //
                      // ),
                      ),

                      SizedBox(height: 10.0),
                      Text(
                        weight.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 35.0,
                        ),

                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                weight --;

                              });
                            },
                            backgroundColor: Color(0xFF4C4F5E),
                            child: Icon(
                                Icons.remove,
                                color: Colors.white,
                            ),
                          ),

                          SizedBox(width: 15.0),
                          FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight ++;
                                });
                              },
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                Icons.add,
                                color: Colors.blue,


                              ),
                          ),

                        ],


                      ),

                    ],
                  ),
                ),
              ),

              Expanded(
                child: ReusableCard(
                  colour: kcolorTheme,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                      ),

                      Text(
                        age.toString(),
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age --;
                                });
                              },

                            backgroundColor: Color(0xFF4C4F5E),

                            child: Icon(
                              Icons.remove,
                                color: Colors.white,

                            ),
                          ),

                          SizedBox(width: 15.0),
                          FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age ++;
                                });
                              },
                            backgroundColor: Color(0xFF4C4F5E),
                            child: Icon(
                              Icons.add,
                              color: Colors.blue,
                            ),

                          )

                        ],
                      )

                    ],
                  ),
                ),
              ),
            ],
            ),
          )
        ],

      ),
    );

  }
}

