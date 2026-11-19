import 'package:demo_app_1/text_field_widget.dart';
import 'package:flutter/material.dart';

class PageA extends StatefulWidget {
  const PageA({super.key});

  @override
  State<PageA> createState() => _PageAState();
}

class _PageAState extends State<PageA> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _username = "";
  String _password = "";
  String message_warning = "";

  dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Login Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Textfieldwidget(
              nameController: _usernameController,
              hintText: "Username",
              errorText: message_warning,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: "Password",
                errorText: message_warning,
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                if (_usernameController.text.isEmpty) {
                  setState(() {
                    message_warning = "Username tidak boleh kosong";
                  });

                  print(message_warning);
                } else {
                  // simpan value dari teks editing controller di setState
                  setState(() {
                    _username = _usernameController.text;
                    _password = _passwordController.text;
                  });
                }

                print("Password: $_username");
                print("Password: $_password");
              },
              child: Text("Login"),
            ),

            Divider(),
            Text("Hasil Login"),
            Text("Username: ${_username}"),
            Text("Password: ${_password}"),
          ],
        ),
      ),
    );
  }
}
