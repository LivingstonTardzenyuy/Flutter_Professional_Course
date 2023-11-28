import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_firestore/firebase_options.dart';
import 'package:firebase_firestore/provider/auth_provider.dart';
import 'package:firebase_firestore/routes.dart';
import 'package:firebase_firestore/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/auth_login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthLoginProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: RoutePages.landigPage,
        routes: RoutePages.allScreens,

      ),
    );
  }
}
