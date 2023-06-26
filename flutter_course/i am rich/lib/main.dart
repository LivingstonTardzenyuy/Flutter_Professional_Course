import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dice app'),
          backgroundColor: Colors.red,

        ),

        body: DicePage(),
      )
    )
  );
}


class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  // const DicePage({Key? key}) : super(key: key);
  int leftDiceNumber = 1;

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Row(
        children: <Widget>[

          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      leftDiceNumber = 5;
                      print('diceNumber = $leftDiceNumber');
                    });
                  },
                  child: Image.asset('images/dice$leftDiceNumber.png'),
                ),
              )
            // image: AssetImage('images/dice1.png'),


          ),

          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                  onPressed: () {
                    print('you also press me');
                  },
                  child: Image.asset('images/dice6.png'),
                ),
              )
          )
        ],
      ),
    );
  }
}

