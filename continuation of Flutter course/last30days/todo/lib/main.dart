import 'package:flutter/material.dart';
import 'package:todo/screens/task_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TasksScreen(),
    );
  }
}


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<Data>(
//       create: (context)  => Data(),
//       child: MaterialApp(
//         home: Scaffold(
//           appBar: AppBar(
//             title: Center(child: MyText()),
//           ),
//           body: Level1(),
//         ),
//       ),
//     );
//   }
// }
//
//
// class Level1 extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//           child: Level2(),
//     );
//   }
// }
//
//
// class Level2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         children: [
//           MyTextfield(),
//           Level3(),
//         ],
//       );
//   }
// }
//
//
// class Level3 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Text(Provider.of<Data>(context).data);
//   }
// }
//
// class MyText extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(Provider.of<Data>(context).data);
//   }
// }
//
// class MyTextfield extends StatelessWidget {
//   // String data = '';
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       textAlign: TextAlign.center,
//       onChanged: (newText){
//         Provider.of<Data>(context, listen: false).changeString(newText);
//       },
//     );
//   }
// }
//
//
//
// class Data extends ChangeNotifier{
//   String data = 'Some Data';
//
//   void changeString(newString){
//     data = newString;
//
//     notifyListeners();
//   }
//
// }