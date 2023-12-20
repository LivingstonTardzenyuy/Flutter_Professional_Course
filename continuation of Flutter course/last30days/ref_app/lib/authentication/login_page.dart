import 'package:flutter/material.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';
import 'package:ref_app/authentication/registration_page.dart';
import 'package:ref_app/screen/home_page.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                "Continue to your account",
                style: TextStyle(color: Colors.white, fontSize: 22,fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 100,
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
                            height: 8,
                          ),
                          GestureDetector(
                            onTap: () {
                              //Forgot Password Page
                            },
                            child: Container(
                                alignment: Alignment.centerRight,
                                child:
                                const Text("Can't remember password?")),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          print(_emailController.text);
                          print(_passwordController.text);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
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
                            "Login",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an Account ?",
                            style: TextStyle(fontSize: 17),
                          ),

                          TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));

                              },
                              child: Text("Register",  style: TextStyle(fontSize: 20)),)
                        ],
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
