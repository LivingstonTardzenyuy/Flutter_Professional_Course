import 'package:flutter/material.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';

import '../screen/home_page.dart';
import 'login_page.dart';

class RefPage extends StatefulWidget {
  @override
  _RefPageState createState() => _RefPageState();
}

class _RefPageState extends State<RefPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();


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
                "Enter your Ref code.",
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
                            hint: 'Enter Ref code',
                            password: false,
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
                            "Continue",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));

                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("No Referal ?",  style: TextStyle(fontSize: 20, color: Colors.black)),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                                },
                                child: Text("Continue", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),))

                          ],
                        ),),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
