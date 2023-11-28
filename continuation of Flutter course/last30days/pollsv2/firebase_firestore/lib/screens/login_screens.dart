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
          children: [
            _buildTextField(controller: _email, label: 'Email'),
            SizedBox(height: 20),
            _buildTextField(controller: _password, label: "Password"),
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
