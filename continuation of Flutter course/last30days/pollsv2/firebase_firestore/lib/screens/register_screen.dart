import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:provider/provider.dart';
import '../Provider/authentification.dart';
import '../Provider/authentification.dart';
import '../routes.dart';

class RegisterScreen extends StatefulWidget {


  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  TextEditingController _confirmPassword = TextEditingController();

  bool _isLoading = false;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Register"),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Consumer<AuthLoginProvider>(
            builder: (context, signup, child){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  formWidget(_emailController, label: "Email"),
                  SizedBox(height: 30,),
                  formWidget(_passwordController, label: "Password"),
                  SizedBox(height: 30,),
                  formWidget(_confirmPassword, label: "Confirm Password"),

                  SizedBox(height: 30,),
                  Container(
                    color: Colors.blue,
                    height: 40,
                    width: MediaQuery.of(context).size.width -10,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue
                      ),
                      onPressed: () async{
                        if(_emailController.text == "" || _passwordController.text == ""){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("All fields are required"), backgroundColor: Colors.red));
                        } else if(_passwordController.text != _confirmPassword.text) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("The 2 passwords must match"), backgroundColor: Colors.red,));
                        } else {
                          User? result = await signup.register(_emailController.text, _passwordController.text);
                          if(result != null){
                            print("success");
                            print(result.email);
                            Navigator.pushNamed(context, RoutePages.loginPage);

                          }

                      }

                      },
                      child: Text('Submit', style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),),
                    ),
                  ),

                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account ?.", style: TextStyle(fontSize: 15),),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, RoutePages.loginPage);
                          },
                          child: Text("Login here", style: TextStyle(fontSize: 15),)),
                    ],
                  ),

                  SizedBox(height: 20,),
                  // Divider(height: 20,),
                  _isLoading ? CircularProgressIndicator() : Consumer<AuthLoginProviderGoogle>(
                      builder: (context, googleAuth, child){
                        return SignInButton(Buttons.Google, text: "Register with Google",
                            onPressed: () async{
                              setState(() {
                                _isLoading = true;
                              });
                              await googleAuth.signInWithGoogle();
                              Navigator.pushNamed(context, RoutePages.homePage);

                              setState(() {
                                _isLoading = false;
                              });
                            }
                        );
                      },
                  ),
                ],
              );
            },

          ),
        ),
      );

  }

  Widget formWidget(TextEditingController controller, {String? label, VoidCallback? onTap}){
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),

    );
  }
}


