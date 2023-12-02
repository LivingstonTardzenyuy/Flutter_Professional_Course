
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:polls/Screens/ButtomNavPages/Home/homepage.dart';
import 'package:polls/Screens/authentification/signUp.dart';
import 'package:polls/Utils/router.dart';

import '../../Provider/authentification_provider.dart';
import '../../Utils/message.dart';
import '../main_activity.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
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
                Container(
                  color: Colors.lightBlueAccent,
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: GestureDetector(
                    onTap: () async {
                      if(_email.text == "" || _password.text == ""){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Both Fields are required'), backgroundColor: Colors.red,));
                      } else {
                        try {
                          User? result = await AuthLoginWithEmailPassword().login(_email.text, _password.text);
                          if(result != null){
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) => HomePage()),
                                    (route) => false);
                          }
                        } catch(e){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e"), backgroundColor: Colors.red,));
                          print("login error: $e");
                        }
                      }
                      AuthLoginWithEmailPassword().login(_email.text, _password.text);
                    },
                    child: Center(child: Text('Login', style: TextStyle(color: Colors.white),)),
                  ),
                ),
        
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account ? "),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp()));
                        },
                        child: Text("Sign up"),
                    ),
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
