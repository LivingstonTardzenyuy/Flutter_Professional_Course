import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/authentification_provider.dart';
import 'Provider/botton_nav_provider.dart';
import 'Screens/splash_screen.dart';
import 'firebase_options.dart';

// initializing a flutter firebase app.
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
        ChangeNotifierProvider(create: (context) => AuthProviders()),
        ChangeNotifierProvider(create: (context) => BottonNavProvider()),
      ],

      child: MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}
