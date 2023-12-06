import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chats/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/auth_provider.dart';
import '../components/rounded_button.dart';
import '../constant.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override

  final _auth =FirebaseAuth.instance;
  late String email;
  late String password;

  Widget build(BuildContext context) {
    return Consumer<AuthProviderD>(
      builder: (BuildContext context, AuthProviderD signin, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: "logo",
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    //Do something with the user input.
                    email = value;
                  },
                  decoration: kInputDecoration.copyWith(hintText: "Enter your email"),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                    textAlign: TextAlign.center,
                    obscureText: true,
                    onChanged: (value) {
                      //Do something with the user input.
                      password = value;
                    },
                    decoration: kInputDecoration.copyWith(hintText: "Enter your Password")
                ),
                SizedBox(
                  height: 24.0,
                ),


                RoundedButton(color: Colors.blueAccent, label: "Login",
                    onTap: () async {
                      try{
                        final user = await signin.login(email: email, password: password);
                        if (user != null){
                          Navigator.pushNamed(context, ChatRoutes.chat_screen);
                        }
                      } catch (e){
                        print(e);
                      }

                    }),
              ],
            ),
          ),
        );
      },

    );
  }
}


class InputField extends StatelessWidget {
  const InputField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        //Do something with the user input.
      },
      decoration: kInputDecoration,
    );
  }
}
