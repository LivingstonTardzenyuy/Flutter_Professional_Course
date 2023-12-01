import 'package:firebase_firestore/screens/models/notes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/crudOperationsUsingFirestore.dart';

class EditNoteScreen extends StatefulWidget {

  EditNoteScreen({
    super.key,
    required this.note,
  });
  NoteModel note;


  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController.text = widget.note.title;
    _descriptionController.text = widget.note.description;
  }
  @override

  // TextEditingController
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        actions: [
          Consumer<FireStoreService>(
            builder: (BuildContext context, FireStoreService delete, child){
              return IconButton(
                  onPressed: () async {
                  await showDialog(
                      context: context, builder: (BuildContext context){
                        return AlertDialog(
                          title: Center(child: Text("Please confirm")),
                          content: Text("Are you sure you want to delete the Note ?"),
                          actions: [
                            TextButton(
                                onPressed: () async {
                                  await delete.deleteNote(widget.note.id);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: Text("Yes")),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: Text("No")),

                          ],
                        );
                  });

                  },

                  icon: Icon(Icons.delete, color: Colors.red,));
            },

          )
        ],
      ),

      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              formWidget(_titleController, label: 'Title'),


              SizedBox(height: 20,),
              TextField(
                controller: _descriptionController,
                minLines: 5,
                maxLines: 10,
                decoration: InputDecoration(
                    border: OutlineInputBorder()
                ),
              ),

              SizedBox(height: 30,),
              isLoading ? Center(child: CircularProgressIndicator(),) : Container(
                color: Colors.orange,
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Consumer<FireStoreService>(
                  builder: (BuildContext context, FireStoreService update, child){
                    return GestureDetector(
                      onTap: () async {
                        if(_descriptionController.text == "" || _titleController.text == ""){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("All fields are required"), backgroundColor: Colors.red,));
                        } else {
                          setState(() {
                            isLoading = true;
                          });
                        }
                       await update.updateNote(
                            widget.note.id, _titleController.text, _descriptionController.text);

                        setState(() {
                          isLoading = false;
                        });
                        Navigator.pop(context);
                      },

                      child: Center(child: Text("Update Note",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)),

                    );  
                  },
                  
                ),
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
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}
