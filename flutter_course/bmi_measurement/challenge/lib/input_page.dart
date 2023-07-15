import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'resuable.dart';
import 'icons_containt.dart';
import 'constant.dart';
import 'bmiresults.dart';
import 'calculator_brain.dart';


class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI Calculator'.toUpperCase(),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                 Expanded(
                    child: GestureDetector(
                      onTap: () {
                        print('you touch me the male');
                      },

                    child: IconAndGender(klabel: 'MALE', kIcon: FontAwesomeIcons.mars,),
                  ),
                ),


                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print('you touch me the female');
                    },
                    child: IconAndGender(klabel: 'FEMALE', kIcon: FontAwesomeIcons.venus,),

                  ),

                ),
              ],
            ),
          ),

          Expanded(
            child: ResusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                      'HEIGHT',
                    style: klabelTextStyle,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                          kHeightOfSlider.toString(),
                        style: klabelHeight,
                      ),
                      Text('cm'),


                    ],
                  ),

                  Slider(
                    value: kHeightOfSlider.toDouble(),
                    min: 50.0,
                    max: 300.0,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),

                    onChanged: (newValue){
                      setState(() {
                        kHeightOfSlider = newValue.round();
                        print(newValue);
                      });
                    },
                  ),
              ],
            ),
          ),
          ),

          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: ResusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: klabelTextStyle,
                        ),

                        Text(
                          kWeight.toString(),
                          style: klabelWidth,
                        ),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    kWeight ++;
                                  });
                                },
                              child: Icon(
                                Icons.add,
                              ),
                              backgroundColor: Colors.redAccent,
                              foregroundColor: Colors.white,
                            ),

                            SizedBox(width: 15.0),
                            FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    kWeight --;
                                  });

                                },
                              child: Icon(Icons.remove),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ResusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            'AGE',
                          style: klabelTextStyle,
                        ),

                        Text(
                          '20',
                          style: klabelWidth,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                                onPressed: () {},
                                child: Icon(
                                  Icons.add,
                                ),
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,

                            ),

                            SizedBox(width: 15.0),
                            FloatingActionButton(
                                onPressed: () {},
                              child: Icon(
                                Icons.remove,
                              ),
                              foregroundColor: Colors.white,
                              // backgroundColor: Colors.bla,
                            )

                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),


          ButtonButton(buttonTitle: 'Caculate'),
        ],
      ),
    );
  }
}


class ButtonButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String buttonTitle;

  ButtonButton({this.onTap,required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CalculatorBrain calc = CalculatorBrain(height: kHeightOfSlider, weight: kWeight);
      Navigator.push(
        context, MaterialPageRoute(
          builder: (context) => MyApp(
            bmiResult: calc.calculateBMi().toString(),
            resultText: calc.getResults(),
            interpretation: calc.getInterpretation(),
          )));
      },

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
