import 'package:flutter/material.dart';
import 'package:polls/Styles/colors.dart';
import 'package:polls/Utils/router.dart';

import '../../Provider/authentification_provider.dart';
import '../../Utils/message.dart';
import '../main_activity.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            AuthProvider().signInWithGoogle().then((value){
              if(value.user == null){
                error(context, message: "Please try again");
              }

              else{
                nextPageOnly(context, MainActivityPage());
              }
            });
          },

          child: Container(
            height: 50.0,
            width: 100,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: const Text('Login'),
          ),
        ),

      )
    );
  }
}