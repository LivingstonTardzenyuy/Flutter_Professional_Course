import 'package:flutter/material.dart';
import 'package:task_management_system/services/theme_services.dart';
import 'package:task_management_system/ui/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: <Widget>[
          Text('Theme Data',
          style: TextStyle(
            fontSize: 30
          ),)
        ],
      )
    );
  }

  _appBar(){
    return AppBar(
      backgroundColor: Colors.blue,
      leading: GestureDetector(
        onTap: () {
          ThemeServices().switchTheme();
        },
        child: Icon(Icons.nightlight_round, color: Colors.white,),
      ),
      actions: [
        Icon(Icons.person, size: 20, color: Colors.white,),
        SizedBox(width: 20,),
      ],
    );
  }
}
