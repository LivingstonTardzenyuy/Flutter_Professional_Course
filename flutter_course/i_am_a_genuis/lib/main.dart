import 'package:flutter/material.dart';
void main() {
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
          child: SafeArea(
            child: Column(
              // verticalDirection: VerticalDirection.,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/picture.jpg'),


                ),
                SizedBox(height: 10.0),

                Text(
                    'KONGNYUY LIVINGSTON',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'IndieFlower',
                    ),
                ),

                SizedBox(height: 10.0),
                Text(
                  'Django and Flutter Developer',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'DancingScript',

                  ),
                ),

                SizedBox(height: 20.0,
                width: 250.0,
                child: Divider(
                  color: Colors.teal.shade100,

                ),
          ),

                Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                  // padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                  child: Padding(
                    padding: EdgeInsets.all(1.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal,

                      ),

                      title: Text(
                        '+237 672384579',
                        style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: 'DancingScript',
                          fontSize: 20.0,

                        ),
                      ),


                    ),
                  ),
                ),

                Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                  // padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal,

                    ),
                    title: Text(
                      'kongnyuylivingstone@gmail.com',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'indieFlower',
                        color: Colors.teal.shade900,
                      ),
                    )
                  )),



                Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                  child: ListTile(
                    leading: Icon(
                        Icons.school,
                        color: Colors.teal,
                    ),

                    title: Text(
                      'University of Bamenda, National Higher Polytechnic Institute, Computer Engineering',
                    ),
                  ),
                ),


                    ],
                  )),
                ),

          ),
        );


  }
}
