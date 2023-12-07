// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oop/firebase_options.dart';
import 'package:oop/routes.dart';

import 'Screens/welcome_screen.dart';

Future<void> main() async{
  runApp(FlashChat());
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

// void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: ChatRoutes.welcome_screen,
      routes: ChatRoutes.allRoutes,
    );
  }
}