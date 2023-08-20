import 'package:flutter/material.dart';
import '../config/appIconsAndImages.dart';
import '../config/app_routes.dart';
import '../config/app_strings.dart';
import '../constants.dart';
import 'package:social_media/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          // height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // SizedBox(height: 10),
                SizedBox(height: 10.0),
                Text(
                  AppStrings.loginToContinue,
                  style: kLoginToC,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.0),
                TextField(
                  decoration: InputDecoration(
                    hintText: AppStrings.username,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.7),
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  decoration: InputDecoration(
                    hintText: AppStrings.password,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.7),
                  ),
                ),
                SizedBox(height: 20.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      print("You pressed me to change password");
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                    ),
                    child: Text(AppStrings.forgotPassword),
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.main);

                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(AppStrings.loginToContinue),
                ),
                SizedBox(height: 15.0),
                Text(
                  AppStrings.orSignInWith,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        print(AppStrings.loginWithFacebook);
                      },
                      child: Image.asset(
                        AppImages.facebook,
                        scale: 7,
                      ),
                    ),
                    SizedBox(width: 25),
                    TextButton(
                      onPressed: () {
                        print(AppStrings.loginWithGoogle);
                      },
                      child: Image.asset(
                        AppImages.google,
                        scale: 5,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25.0),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      AppStrings.dontHaveAnAccount,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        AppStrings.signUp,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}