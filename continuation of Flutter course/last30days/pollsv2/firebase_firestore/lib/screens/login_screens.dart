import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_firestore/routes.dart';
import 'package:firebase_firestore/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/authentification.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController _password = TextEditingController();
  TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Consumer<AuthLoginProvider>(
          builder: (context, loginProvider, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTextField(controller: _email, label: 'Email'),
                SizedBox(height: 20),
                _buildTextField(controller: _password, label: "Password"),

                SizedBox(height: 30,),
                Container(
                  color: Colors.blue,
                  height: 40,
                  width: MediaQuery.of(context).size.width -10,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue
                    ),
                    onPressed: () async {
                      if(_email.text == "" || _password.text == ""){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Both Fields are required'), backgroundColor: Colors.red,));
                      } else {
                        try{
                          User? result = await loginProvider.login(_email.text, _password.text);
                              if(result !=null){
                                print("sucess");
                                print(result.email);
                                Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) => HomeScreen(user: result,)),
                                    (route) => false);
                              }
                        } catch (e){
                          print("login error: $e");
                        }

                      }

                    },
                    child: Text('Submit', style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),),
                  ),
                ),

              ],
            );
          },

        ),
      ),
    );
  }

  Widget _buildTextField({required TextEditingController controller, String? label}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}
