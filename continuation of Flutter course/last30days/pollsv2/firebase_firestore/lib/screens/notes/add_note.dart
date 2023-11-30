import 'package:flutter/material.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  @override

  TextEditingController _title = TextEditingController();
  // TextEditingController
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
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
                decoration: InputDecoration(
                    border: OutlineInputBorder()
                ),
              ),

              SizedBox(height: 30,),
              Container(
                color: Colors.orange,
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: GestureDetector(
                  onTap: () {

                  },
                  child: Center(child: Text("Add Note",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)),

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
