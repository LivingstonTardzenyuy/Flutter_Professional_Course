// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ref_app/provider/auth_profile.dart';
import 'package:ref_app/screen/splash.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(ReferalApp());
}


class ReferalApp extends StatelessWidget {
  const ReferalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}
