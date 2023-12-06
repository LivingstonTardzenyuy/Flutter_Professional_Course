import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chats/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/auth_provider.dart';
import '../components/rounded_button.dart';
import '../constant.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  late String _email;
  late String _password;
  late String _confirmPassword;
  bool _showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Consumer<AuthProviderD>(
          builder: (BuildContext context, AuthProviderD signup, Widget? child) {
            return SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Hero(
                          tag: "logo",
                          child: Container(
                            child: Image.asset('images/logo.png'),
                            height: 200.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 48.0,
                      ),
                      TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          _email = value;
                          print(_email);
                        },

                        decoration: kInputDecoration.copyWith(hintText: "Enter your Email"),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                          obscureText: true,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            _password = value;
                            print(_password);
                          },
                          decoration: kInputDecoration.copyWith(hintText: "Enter your password ")

                      ),

                      SizedBox(height: 20,),
                      TextField(
                          obscureText: true,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            _confirmPassword = value;
                            print(_confirmPassword);
                          },
                          decoration: kInputDecoration.copyWith(hintText: "Enter your password ")

                      ),
                      SizedBox(
                        height: 24.0,
                      ),

                      RoundedButton(color: Colors.blueAccent, label: "Register",
                          onTap: () async {
                            if(_email == "" || _password == ""){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("All fields are required"), backgroundColor: Colors.red,));
                            } else if (_password != _confirmPassword){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Both passwords must be the same"), backgroundColor: Colors.red,));
                            } else {
                                User? result = await signup.register(email: _email, password: _password);
                                if (result != null){
                                  Navigator.pushNamed(context, ChatRoutes.chat_screen);
                              }
                            }
                          })
                    ],
                  ),
                ),
              ),
            );
          },

        ),
      ),
    );
  }
}
