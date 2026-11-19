import 'package:flutter/material.dart';

class Textfieldwidget extends StatelessWidget {
  const Textfieldwidget({
    super.key,
    required this.nameController,
    required this.hintText,
    required this.errorText,
    required this.visionPass
  });

  final TextEditingController nameController;
  final String hintText;
  final String errorText;
  final bool? visionPass;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(
        controller: nameController,
        obscureText: visionPass!,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
          errorText: errorText,
        ),
      ),
    );
  }
}
