import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String data = 'John Rambo';

  void changeValue(String dataChange){
    setState(() {
      data = dataChange;
    });
  }
  @override
  Widget build(BuildContext context) {
    print('Building MainPage');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(data),
      ),
      body: Screen2(data: data, changeData: changeValue,),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({Key? key, required this.data, required this.changeData}) : super(key: key);
  final String data;
  final Function (String) changeData;
  @override
  Widget build(BuildContext context) {
    print('Building Screen2');
    return Container(
      child: Screen3(data: data, changeData: changeData,),
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({Key? key, required this.data, required this.changeData}) : super(key: key);
  final String data;
  final Function (String) changeData;
  @override
  Widget build(BuildContext context) {
    print('Building Screen3');
    return Container(
      child: Screen4(data: data, changeData: changeData,),
    );
  }
}

class Screen4 extends StatefulWidget {
  const Screen4({Key? key, required this.data, required this.changeData}) : super(key: key);
  final String data;
  final Function (String) changeData;

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  @override
  Widget build(BuildContext context) {
    print('Building Screen4');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.data),
          SizedBox(height: 30,),
          TextButton(

            onPressed: () {
              setState(() {
                widget.changeData('New Data change');
              });
            },
            child: Container(
                height: 40, width: 120,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text('Change state', style: TextStyle(color: Colors.white),))),
          ),
        ],
      ),
    );
  }
}



