import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pollsv2/Screens/Authentification/auth_page.art.dart';

import '../../../Provider/authentification_provider.dart';
import '../../../Styles/colors.dart';
import '../../../Utils/messages.dart';
import '../../../Utils/router.dart';
import '../../main_activity_page.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            AuthProviders().logOut().then((value){
              if(value  == false){
                error(context, message: "Please try again");
              } else {
                nextPageOnly(context, AuthPage());
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
            child: const Text('Log Out'),
          ),
        ),
      ),
    );
  }
}
