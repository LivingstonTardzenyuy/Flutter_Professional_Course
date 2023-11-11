import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // final String data = 'This is my Data';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataModel>(
        create: (_) => DataModel(),
      // create: (_) => DataModel().toString()

      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Some Data', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.lightBlueAccent),),
          ),
          body: Level1(),
        ),
      // ),
    ),
    );
  }
}


class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Level2(),
    );
  }
}


class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Level3(),
          MyTextField(),
        ],
      ),
    );
  }
}



class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataModel = Provider.of<DataModel>(context);
    return Scaffold(
      body: Center(child: Text(dataModel.data, style: TextStyle(color: Colors.lightBlueAccent, fontSize: 25),)),
    );
  }
}


// class MyText extends StatelessWidget {
//   const MyText({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final dataModel = Provider.of<DataModel>(context);
//     return Center(child: Text(dataModel.data, style: TextStyle(color: Colors.lightBlueAccent, fontSize: 25),));
//
//   }
// }


class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
          onChanged: (newText) {
            Provider.of<DataModel>(context).updateData(newText);
          },
    );
  }
}



class DataModel extends ChangeNotifier {
  String data = 'Some Data';

  void updateData(String newData){
    data = newData;
    notifyListeners();
  }
}