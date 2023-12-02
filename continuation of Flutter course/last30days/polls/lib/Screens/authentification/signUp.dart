

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:provider/provider.dart';

import '../../Provider/authentification_provider.dart';
import 'package:flutter/material.dart';

import '../../Utils/message.dart';
import '../../Utils/router.dart';
import '../main_activity.dart';
import 'auth_page.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();
TextEditingController _confirmPassword = TextEditingController();
AuthProviders authProvider = AuthProviders();  // Create an instance

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SignUp Screen'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Welcome to the Polling app", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25, color: Colors.lightBlueAccent),),
                  SizedBox(height: 20,),
          
                  InputForm(_email, label: "Email"),
          
                  SizedBox(height: 20,),
                  InputForm(_password, label: "Password"),
          
                  SizedBox(height: 20,),
                  InputForm(_confirmPassword, label: "Confirm Password"),
          
                  SizedBox(height: 20,),
                  Container(
                    color: Colors.lightBlueAccent,
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: Consumer<AuthLoginWithEmailPassword>(
          
                      builder: (BuildContext context, AuthLoginWithEmailPassword signup, Widget? child) {
                        return GestureDetector(
                          onTap: () async {
                            if(_email.text == "" || _password.text == ""){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Both fields are required'), backgroundColor: Colors.red,));
                            } else if(_password.text != _confirmPassword.text){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('the Passwords don\'t are match'), backgroundColor: Colors.red,));
                            } else {
                              User? result = await signup.register(_email.text, _password.text);
                              if(result != null){
                                print('success');
                                print(result.email);
                                Navigator.push(context, MaterialPageRoute(builder: (context) => AuthPage()));
                              }
                            }
                          },
                          child: Center(child: Text('Sign up', style: TextStyle(color: Colors.white),)),
                        );
                      },
          
                    ),
                  ),
          
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account ? "),
                      Text("Sign up"),
                    ],
                  ),
          
                  SizedBox(height: 20,),
                  Text('Or'),
          
                  SizedBox(height: 20,),
                  Text('SignUp with Google', style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
          
                  SignInButton(
                    Buttons.Google,
                    text: "Sign up with Google",
                    onPressed: () {
                      {
                        AuthProviders().signInWithGoogle().then((value){
                          if(value.user == null){
                            error(context, message: "Please try again");
                          }
          
                          else{
                            nextPageOnly(context, MainActivityPage());
                          }
                        });
                      }
                    },
                  )
                ],
              ),
            ),
          
          ),
        )
    );
  }

  Widget InputForm(TextEditingController controller, {String? label, VoidCallback? onTap}){
    return TextFormField(
      onTap: onTap,
      readOnly: onTap == null ? false : true,
      controller: controller,
      validator: (value){
        if(value!.isEmpty){
          return "$label required";
        }
        return null;
      },

      decoration: InputDecoration(
        border: OutlineInputBorder(),
        errorBorder: const OutlineInputBorder(),
        labelText: label,
      ),
    );
  }
}
