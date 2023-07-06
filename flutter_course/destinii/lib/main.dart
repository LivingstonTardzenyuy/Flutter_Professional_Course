import 'package:destinii/story_brain.dart';
import 'package:flutter/material.dart';

//TODO: step 15

void main() => runApp(Destini());


class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}


StoryBrain storyBrain  = StoryBrain();


class StoryPage extends StatefulWidget {
  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        //TODO step 1- Adding packaground.png to this container
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,

          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Center(
                    child: Text(
                      storyBrain.getStory().storyTitle,
                      // 'Story text will go here',
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {

                    //TODO: step 18
                    setState(() {
                      storyBrain.nextStory(1);
                    });


                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  ),

                  child: Text(
                    storyBrain.getChoice1(),
                    // 'Choice one',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                )
              ),

              SizedBox(height: 20.0),


              Expanded(
                flex: 2,
                //TODO: step 26
                //TODO: step 28
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      storyBrain.nextStory(2);

                    });
                    //TODO: step 19
                  },

                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                  ),

                  child: Text(
                    storyBrain.getChoice2(),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//TODO: step 24

//TODO : step 29