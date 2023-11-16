
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


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

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print('Building MainPage');
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      builder: (context, child){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text(context.watch<AppData>().name),
          ),
          body: Screen2(),
        );
      },
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Building Screen2');
    return Container(
      child: Screen3(),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Building Screen3');
    return Container(
      child: Screen4(),
    );
  }
}

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Building Screen4');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(context.watch<AppData>().name),
          SizedBox(height: 30,),
          TextButton(

            onPressed: () {
                context.read<AppData>().changeData('I have change the State of this data');
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



class AppData with ChangeNotifier{
  String _name = 'John Rambo';

  void changeData(String data){
    _name = data;

    notifyListeners();
  }

  String get name => _name;
}