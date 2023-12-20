// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ref_app/provider/auth_profile.dart';
import 'package:ref_app/provider/ref_provider.dart';
import 'package:ref_app/screen/splash.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ReferalApp());
}



class ReferalApp extends StatelessWidget {
  const ReferalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProviderDb()),
        ChangeNotifierProvider(create: (context) => RefProvider()),
      ],
      child: MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}
