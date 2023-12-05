// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chats/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/auth_provider.dart';
import 'firebase_options.dart';

Future<void> main() async{
  runApp(FlashChat());
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}


class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProviderD()),
      ],
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.black54),
          ),
        ),
        initialRoute: ChatRoutes.welcome_screen,
        routes: ChatRoutes.allRoutes,
      ),
    );
  }
}