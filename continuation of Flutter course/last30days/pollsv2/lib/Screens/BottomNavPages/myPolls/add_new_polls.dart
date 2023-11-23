
import 'package:flutter/material.dart';

class AddPollPage extends StatefulWidget {
  const AddPollPage({super.key});

  @override
  State<AddPollPage> createState() => _AddPollPageState();
}

class _AddPollPageState extends State<AddPollPage> {

  TextEditingController question = TextEditingController();
  TextEditingController option1 = TextEditingController();
  TextEditingController option2 = TextEditingController();
  TextEditingController duration = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey();      // uniquely identifies each form we are in.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Add a new Pole'),
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
                    formWidget(question, label: 'Question'),
                    formWidget(option1, label: "Option 1"),
                    formWidget(option2, label: "option 2"),
                    formWidget(duration, label: "Duration", onTap: () {
                      showDatePicker(context: context,initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.utc(2027)).then((value){
                        if(value == null){
                          duration.clear();
                        } else {
                          duration.text = value.toString();
                        }
                      });
                    }),

                    GestureDetector(
                      onTap: () {
                        if (_formkey.currentState!.validate()){

                        }
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 50,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Text('Post Poll', style: TextStyle(color: Colors.white),)),
                      ),
                    )
                  ]
                    ),


                ),

              ),
            ),
        ],
      )
    );
  }

  Widget formWidget(TextEditingController controller, {String? label, VoidCallback? onTap}){
    return Container(
        margin: const EdgeInsets.all(10),
    child: TextFormField(
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
    ),
    );
  }
}
