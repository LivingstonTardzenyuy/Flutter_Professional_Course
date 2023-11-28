import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';
import '../routes.dart';

class RegisterScreen extends StatelessWidget {


  @override
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: Scaffold(
          appBar: AppBar(
            title: Text("Register"),
            centerTitle: true,
            backgroundColor: Colors.orangeAccent,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
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
                    onPressed: () {},
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
                )
              ],
            ),
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


