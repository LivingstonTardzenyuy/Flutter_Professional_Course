import 'package:flutter/material.dart';
import 'package:polls/Provider/db_provider.dart';
import 'package:polls/Styles/colors.dart';
import 'package:provider/provider.dart';

import '../../../Utils/message.dart';

class AddPollPage extends StatefulWidget {
  // const AddPollPage({super.key});

  @override
  State<AddPollPage> createState() => _AddPollPageState();
}

class _AddPollPageState extends State<AddPollPage> {

  TextEditingController _questionController = TextEditingController();
  TextEditingController _optionOneController = TextEditingController();
  TextEditingController _optionTwoController = TextEditingController();
  TextEditingController _duration = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Poll'),
      ),

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                  // form fields for adding questions.
                    formWidget(_questionController, label: "Question"),
                    formWidget(_optionOneController, label: "Option 1"),
                    formWidget(_optionTwoController, label: "Option 2"),
                    formWidget(_duration, label: "Duration", onTap: () {
                      showDatePicker(context: context,initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.utc(2027)).then((value){
                        if(value == null){
                          _duration.clear();
                        }else{
                          _duration.text = value.toString();
                        }
                      });
                    }),

                    //create button
                   Consumer<DbProvider>(
                     builder: (BuildContext context, db, Widget? child) {
                       WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                         if(db.message != ""){
                           if(db.message.contains("Poll Created")){
                             success(context, message: db.message);
                             db.clear();
                           }

                           else{
                             error(context, message: db.message);
                             db.clear();
                           }
                         }
                       });
                       return GestureDetector(
                         onTap:db.status == true ? null : () {
                           if (_formkey.currentState!.validate()){
                             List<Map> options = [{
                               "answer": _optionOneController.text.trim(),
                               "percent": 0,
                             },
                               {
                                 "answer": _optionTwoController.text.trim(),
                                 "percent": 0,
                               }
                             ];

                             print(options);
                             db.addPoll(question: _questionController.text.trim(), duration: _duration.text.trim(), options: options);
                           }
                         },

                         child: Container(
                           height: 50,
                           width: MediaQuery.of(context).size.width - 100,
                           decoration: BoxDecoration(
                             color:db.status == true ? AppColors.grey : AppColors.primaryColor,
                             borderRadius: BorderRadius.circular(10),
                           ),
                           alignment: Alignment.center,
                           child: Text(db.status == true ? "Please wait..." : 'Post poll'),

                         ),

                       );
                     },

                   )
                  ],
                ),
              ),
            ),
          )
        ],
      )
    );
  }

  Widget formWidget(TextEditingController controller, {String? label, VoidCallback? onTap}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        onTap: onTap,
        readOnly: onTap == null ? false : true,
        controller: controller,
        validator: (value){
          if(value!.isEmpty){
            return "Input is required";
          }

          return null;
        },
        decoration: InputDecoration(
          errorBorder: const OutlineInputBorder(),
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
