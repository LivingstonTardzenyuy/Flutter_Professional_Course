import 'package:flutter/material.dart';

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
        child: Column(
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
                onPressed: () {},
                child: Text('Submit', style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),),
              ),
            ),

          ],
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
