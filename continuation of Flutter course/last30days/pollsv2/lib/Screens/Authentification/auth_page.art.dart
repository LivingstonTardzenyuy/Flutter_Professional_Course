import 'package:flutter/material.dart';
import 'package:pollsv2/Utils/router.dart';
import 'package:provider/provider.dart';

import '../../Provider/authentification_provider.dart';
import '../../Styles/colors.dart';
import '../../Utils/messages.dart';
import '../main_activity_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProviders>(
      builder: (BuildContext context, data, child){
        return Scaffold(
          body: Center(
            child: GestureDetector(
              onTap: () {
                data.signInWithGoogle().then((value){
                  if(value.user == null){
                    error(context, message: "Please try again");
                  } else{
                    nextPage(context, MainActivity());
                  }
                });
              },
              child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: const Text('Login'),
              ),
            ),
          ),
        );
      }

    );
  }
}
