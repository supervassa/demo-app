import 'package:demo_app_1/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _username = "";
  String _password = "";
  String message_warning = "";

  void _handleLogin() async {
    if (_usernameController.text.isEmpty) return;

    final pref = await SharedPreferences.getInstance();
    await pref.setBool('is_logged_in', true);
    await pref.setString("username", _usernameController.text);

    if (!mounted) return;
    Navigator.pushReplacementNamed(context, "/home");
  }

  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("SIAKAD POLMAIN", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.all(8),
              height: 100,
              width: 100,
              child: Image.network("https://play-lh.googleusercontent.com/_wCvAIKdFwlZnhz6nDydxijbgT1UJqb0weTWL-uNd9-D7vcqufazebv_ZHX-S10nPA2krQoAKZovEY5K9TfECw"),
            ),
            SizedBox(height: 10,),
            Textfieldwidget(
              nameController: _usernameController,
              hintText: "Username",
              errorText: message_warning,
              visionPass: false,
            ),
            Textfieldwidget(
              nameController: _passwordController,
              hintText: "Password",
              errorText: message_warning,
              visionPass: true,
            ),
            ElevatedButton(
              onPressed: () {
                _handleLogin();
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
