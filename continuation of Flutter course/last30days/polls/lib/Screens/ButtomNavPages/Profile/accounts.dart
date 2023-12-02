import 'package:flutter/material.dart';
import 'package:polls/Screens/authentification/auth_page.dart';

import '../../../Provider/authentification_provider.dart';
import '../../../Styles/colors.dart';
import '../../../Utils/message.dart';
import '../../../Utils/router.dart';
import '../../main_activity.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () {

              AuthProviders().logOut().then((value){
                if(value == false){
                  error(context, message: "Please try again");
                }

                else{
                  nextPageOnly(context, AuthPage());
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
              child: const Text('Log Out'),
            ),
          ),

        )
    );
  }
}
