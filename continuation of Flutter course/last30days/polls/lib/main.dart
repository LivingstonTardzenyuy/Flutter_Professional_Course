import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:polls/firebase_options.dart';
import 'package:provider/provider.dart';

import 'Provider/authentification_provider.dart';
import 'Provider/bottom_nav_provider.dart';
import 'Provider/db_provider.dart';
import 'Provider/fetch_polls.dart';
import 'Screens/splash_screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthProvider()),
          ChangeNotifierProvider(create: (context) => BottomNavProvider()),
          ChangeNotifierProvider(create: (context) => DbProvider()),
          ChangeNotifierProvider(create: (context) => FetchPollsProvider()),
        ],
    child: MaterialApp(
        home: SplashScreen(),
    ),
    );
  }
}

