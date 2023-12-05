import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/auth_provider.dart';
import '../components/rounded_button.dart';
import '../constant.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  late String _email;
  late String _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<AuthProviderD>(
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
                      height: 8.0,
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
                    SizedBox(
                      height: 24.0,
                    ),

                    RoundedButton(color: Colors.blueAccent, label: "Register",
                        onTap: () {
                          signup.register(email: _email, password: _password);
                        })
                  ],
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
