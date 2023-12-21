import 'package:flutter/material.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';
import 'package:provider/provider.dart';
import 'package:ref_app/Utils/message.dart';
import 'package:ref_app/provider/ref_provider.dart';

import '../enums/state.dart';
import '../screen/home_page.dart';
import 'login_page.dart';

class RefPage extends StatefulWidget {
  @override
  _RefPageState createState() => _RefPageState();
}

class _RefPageState extends State<RefPage> {
  final TextEditingController _refcodeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RefProvider>(
        builder: (BuildContext context, RefProvider value, Widget? child) {
          return value.state == ViewState.Busy ?
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
                                _refcodeController,
                                hint: 'Enter Ref code',
                                password: false,
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () async {
                              if(_refcodeController.text.isEmpty){
                                showMessage(context, "Please enter your Ref code");
                              } else {
                                await value.setReferrals(_refcodeController.text.trim());
                                if(value.state == ViewState.Success){
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => const HomePage()),
                                        (route) => false,
                                  );
                                }
                              }
                              //Validate User Inputs
                             print(_refcodeController.text);
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("No Referal ?",  style: TextStyle(fontSize: 20, color: Colors.black)),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
                                  },
                                  child: Text("Proceed", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),))

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
