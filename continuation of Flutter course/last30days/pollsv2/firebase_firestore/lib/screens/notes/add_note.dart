import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/crudOperationsUsingFirestore.dart';

class AddNoteScreen extends StatefulWidget {
  AddNoteScreen({
    super.key,
    required this.user
  });
  User user;
  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  @override

  TextEditingController _title = TextEditingController();
  TextEditingController _description = TextEditingController();
  bool isLoading = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
      ),

      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              formWidget(_title, label: 'Title'),


              SizedBox(height: 20,),
              TextField(
                minLines: 5,
                maxLines: 10,
                controller: _description,
                decoration: InputDecoration(
                    border: OutlineInputBorder()
                ),
              ),

              SizedBox(height: 30,),

              isLoading == true? Center(child: CircularProgressIndicator()) : Consumer<FireStoreService>(
                builder: (BuildContext context, FireStoreService value, Widget? child) {
                  return Container(
                    color: Colors.orange,
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: GestureDetector(
                      onTap: () async {
                        if(_description.text == null || _title.text == null){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("All fields are required"), backgroundColor: Colors.red,));
                        } else {
                          setState(() {
                            isLoading = true;
                          });
                          value.insertNote(_title.text, _description.text, widget.user.uid);
                          setState(() {
                            isLoading = false;
                          });
                          Navigator.pop(context);
                        }
                      },
                      child: Center(child: Text("Add Note",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)),

                    ),
                  );
                },

              )
            ],
          ),
        ),
      ),
    );

  }

  Widget formWidget(TextEditingController controller, {String? label, VoidCallback? onTap}){
    return TextFormField(
      onTap: onTap,
      readOnly: onTap == null ? false : true,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty){
          return "${label} is required";
        }
        return null;
      },

      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(),
        labelText: label,labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(),
      ),
    );
  }
}
