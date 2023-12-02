import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:polls/Screens/main_activity.dart';
import 'package:polls/Utils/router.dart';
import '../Utils/dynamic_utils.dart';
import 'ButtomNavPages/MyPoles/individual_poll.dart';
import 'authentification/auth_page.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  User? user = FirebaseAuth.instance.currentUser;

  void navigate(){
    Future.delayed(const Duration(seconds: 3), () {
      if(user == null) {
        nextPageOnly(context, AuthPage());
      }
        else{
          DynamicLinkProvider().initDynamicLink().then((value){
            if(value == ""){
              nextPageOnly(context, MainActivityPage());
            } else {
              nextPage(context, IndividualPollsPage(id: value));
            }

          });
      }
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigate();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              child: FlutterLogo(),
            ),
          ),
        )
    );
  }
}
