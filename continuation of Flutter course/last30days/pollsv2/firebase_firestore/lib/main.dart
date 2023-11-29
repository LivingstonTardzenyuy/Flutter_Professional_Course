import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_firestore/routes.dart';
import 'package:firebase_firestore/screens/home_screen.dart';
import 'package:firebase_firestore/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/authentification.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseAuth get firebaseAuth => _firebaseAuth;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthLoginProvider()),
        ChangeNotifierProvider(create: (context) => AuthLoginProviderGoogle()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: RoutePages.landigPage,
        routes: RoutePages.allScreens,

        // Allow users to be redirected to their home screen once they have registered using their device.
        home: StreamBuilder<User?>(
          stream: AuthService().firebaseAuth.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
            if (snapshot.hasData) {
              return HomeScreen();
            }
            return RegisterScreen();
          },
        ),
      ),
    );
  }
}
