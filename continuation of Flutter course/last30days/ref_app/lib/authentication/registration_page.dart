import 'package:flutter/material.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';
import 'package:provider/provider.dart';
import 'package:ref_app/Utils/message.dart';
import 'package:ref_app/authentication/ref_page.dart';
import 'package:ref_app/enums/state.dart';

import '../provider/auth_profile.dart';
import 'login_page.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<AuthProviderDb>(
          builder: (BuildContext context, AuthProviderDb authLogin, child){
            return authLogin.state == ViewState.Busy ?
              Center(child: CircularProgressIndicator(),)
                :
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.blueAccent),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        "Register to your account",
                        style: TextStyle(color: Colors.white, fontSize: 22,fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Expanded(
                      child: Container(
                          padding: const EdgeInsets.all(30.0),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  CustomTextField(
                                    _emailController,
                                    hint: 'Email',
                                    password: false,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomTextField(
                                    _passwordController,
                                    hint: 'Password',
                                    obscure: true,
                                  ),
                            
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomTextField(
                                    _confirmPasswordController,
                                    hint: 'confirm Password',
                                    obscure: true,
                                  ),
                            
                                  const SizedBox(
                                    height: 2,
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () async {
                                  print(_emailController.text);
                                  print(_passwordController.text);
                            
                                  if(_passwordController.text.trim() != _confirmPasswordController.text.trim()){
                                    showMessage(context, "The passwords don't match");
                                  } else{
                                    if(_passwordController.text.isEmpty || _emailController.text.isEmpty || _confirmPasswordController.text.isEmpty){
                                      showMessage(context, "All fields are required");
                                    } else {
                                      await authLogin.registerUser(_emailController.text.trim(), _passwordController.text.trim());
                                      if(authLogin.state == ViewState.Success){
                                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => RefPage()), (route) => false);
                                      } else {
                                        showMessage(context, authLogin.message);
                                      }

                                    }
                                  }
                                  //Validate User Inputs
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(15.0),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.purple,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Have an Account ?",
                                    style: TextStyle(fontSize: 17),
                                  ),
                            
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                            
                                    },
                                    child: Text("Login",  style: TextStyle(fontSize: 18, color: Colors.purple)),)
                                ],
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
            );
          },
      
        ),
    );
  }
}
