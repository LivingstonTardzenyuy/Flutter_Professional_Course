
import 'package:flutter/material.dart';
import 'package:oop/Screens/chat_screen.dart';
import 'package:oop/Screens/registration_screen.dart';

import 'Screens/welcome_screen.dart';

class ChatRoutes {
  static final Map<String, WidgetBuilder> allRoutes = {

    login_screen: (BuildContext context) => RegistrationScreen(),
    welcome_screen: (BuildContext context) => WelcomeScreen(),
    chat_screen: (BuildContext context) => ChatScreen(),

  };

  static const String login_screen = "login screen";
  static const String welcome_screen = "Welcome Screen";
  static const String chat_screen = "Chat Screen";
}