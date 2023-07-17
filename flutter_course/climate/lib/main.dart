import 'package:flutter/material.dart';
import 'screens/loading_screen.dart';
import 'package:geolocator_platform_interface/geolocator_platform_interface.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GeolocatorPlatform.instance;


  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
